# Maintainer: Walter Dworak <preparationh67@gmail.com>
# Contributor: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=kanboard
pkgver=1.0.18
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
sha256sums=('99bce9e111226433c6845ce67991ee38c030e1f539372c7dc9e9b3d8b3342e44')

package() {
    cd "${pkgdir}"
    mkdir -p usr/share/webapps
    mv "${srcdir}/${pkgname}-${pkgver}" usr/share/webapps/${pkgname}
    # Change ownership of data/ directory to allow http user to write to it
    chown -R http:http "${pkgdir}//usr/share/webapps/kanboard/data"
}

