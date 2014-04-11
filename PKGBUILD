# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=wallabag
pkgver=1.6.1
pkgrel=1
pkgdesc='Self hostable application for saving web pages'
arch=('any')
url='http://www.wallabag.org/'
license=('WTFPL')
depends=('php>=5.3' 'php-tidy' 'pcre' 'mariadb')
optdepends=('php-sqlite: For sqlite storage' 'php-pgsql: For postgres storage')
install="$pkgname.install"
options=(!strip)
source=("https://github.com/wallabag/wallabag/archive/${pkgver}.tar.gz"
        "vendor.zip::http://wllbg.org/vendor")
sha256sums=('ff3cd32235fbc1247dd93faff2b355c7aec1368bc96c5a85da954e0aee1c7d42'
            'bd3e843290de28f1c20fa19ed746ca221c9174cb7f0a9723618f21bddb883e12')

package() {
    cd "${pkgdir}"
    mkdir -p usr/share/webapps
    mv "${srcdir}/${pkgname}-${pkgver}" usr/share/webapps/${pkgname}
    mv "${srcdir}/vendor" usr/share/webapps/${pkgname}/vendor
    chown -R http:http "${pkgdir}"
}

