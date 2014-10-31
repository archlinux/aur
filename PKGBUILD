# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=kanboard
pkgver=1.0.8
pkgrel=1
pkgdesc='Simple visual task board'
arch=('any')
url='http://kanboard.net/'
license=('AGL3')
depends=('php')
optdepends=('mariadb: For MySQL storage' 'php-sqlite: For sqlite storage' 'php-pgsql: For postgres storage')
install="$pkgname.install"
options=(!strip)
source=("https://github.com/fguillot/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f89fa950930837ba11bdca0c08f805658cc2e0bdd675a36e8f719ff432ec0054')

package() {
    cd "${pkgdir}"
    mkdir -p usr/share/webapps
    mv "${srcdir}/${pkgname}-${pkgver}" usr/share/webapps/${pkgname}
    # Change ownership of data/ directory to allow http user to write to it
    chown -R http:http "${pkgdir}//usr/share/webapps/kanboard/data"
}

