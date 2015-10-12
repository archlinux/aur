# Maintainer: Walter Dworak <preparationh67@gmail.com>
# Contributor: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=kanboard
pkgver=1.0.19
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
sha256sums=('53d86c97068deb08763e337d3bb1ba42210397e248f6d1401605b3225a932ae4')

package() {
    cd "${pkgdir}"
    mkdir -p usr/share/webapps
    mv "${srcdir}/${pkgname}-${pkgver}" usr/share/webapps/${pkgname}
    # Change ownership of data/ directory to allow http user to write to it
    chown -R http:http "${pkgdir}//usr/share/webapps/kanboard/data"
}

