# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=wallabag
pkgver=1.8.0
pkgrel=1
pkgdesc='Self hostable application for saving web pages'
arch=('any')
url='http://www.wallabag.org/'
license=('WTFPL')
depends=('php>=5.3' 'php-tidy' 'pcre')
optdepends=('mariadb: For MySQL storage' 'php-sqlite: For sqlite storage' 'php-pgsql: For postgres storage')
install="$pkgname.install"
options=(!strip)
source=("https://github.com/wallabag/wallabag/archive/${pkgver}.tar.gz"
        "vendor.zip::http://wllbg.org/vendor")
sha256sums=('60d674624aa5877d49861bc48a2f01466cc9db3893ae450c418714260c9445a2'
            'bd3e843290de28f1c20fa19ed746ca221c9174cb7f0a9723618f21bddb883e12')

package() {
    cd "${pkgdir}"
    mkdir -p usr/share/webapps
    mv "${srcdir}/${pkgname}-${pkgver}" usr/share/webapps/${pkgname}
    mv "${srcdir}/vendor" usr/share/webapps/${pkgname}/vendor
    chown -R http:http "${pkgdir}"
}

