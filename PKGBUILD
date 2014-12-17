# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=wallabag
pkgver=1.8.1b
pkgrel=1
pkgdesc='Self hostable application for saving web pages'
arch=('any')
url='http://www.wallabag.org/'
license=('MIT')
depends=('php>=5.3' 'php-tidy' 'pcre')
optdepends=('mariadb: For MySQL storage' 'php-sqlite: For sqlite storage' 'php-pgsql: For postgres storage')
install="$pkgname.install"
options=(!strip)
source=("https://github.com/wallabag/wallabag/archive/${pkgver}.tar.gz"
        "vendor.zip::http://wllbg.org/vendor")
sha256sums=('03a07e7e34565892a75d0fcb7c7f693d8318f69fd216b984005b6a7aa8640761'
            'bd3e843290de28f1c20fa19ed746ca221c9174cb7f0a9723618f21bddb883e12')

package() {
    cd "${pkgdir}"
    mkdir -p usr/share/webapps
    mv "${srcdir}/${pkgname}-${pkgver}" usr/share/webapps/${pkgname}
    mv "${srcdir}/vendor" usr/share/webapps/${pkgname}/vendor
    chown -R http:http "${pkgdir}"
}

