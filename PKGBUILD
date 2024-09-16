# Contributor: Dct Mei <dctxmei@yandex.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Maintainer: jakka <jakkadoujin at gmail dot com>


pkgname=xray-domain-list-community
pkgver=20240914091803
pkgrel=1
pkgdesc="A list of domains to be used as geosites for routing purpose in Project V"
arch=('any')
url="https://github.com/v2fly/domain-list-community"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('074b5ca204f2c529f8fc0861f163332ddfb15f074c69e7d5f50ff534e2b949ff')

build() {
    cd "${srcdir}"/"domain-list-community-${pkgver}"/
    go run main.go
}

package() {
    cd "${srcdir}"/"domain-list-community-${pkgver}"/
    install -Dm 644 dlc.dat "${pkgdir}"/usr/share/xray/geosite.dat
    install -Dm 644 "${srcdir}"/"domain-list-community-${pkgver}"/LICENSE -t "${pkgdir}"/usr/share/licenses/"$pkgname"/
}
