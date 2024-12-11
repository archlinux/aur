# Maintainer:
# Contributor: Dct Mei <dctxmei@yandex.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: jakka <jakkadoujin at gmail dot com>

pkgname=xray-domain-list-community
pkgver=20241210004721
pkgrel=1
pkgdesc="A list of domains to be used as geosites for routing purpose in Project V"
arch=('any')
url="https://github.com/v2fly/domain-list-community"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('5db3f2acc48591df48672def9428893279478cf538bec0eb174c350bb159ce53')

build() {
    cd "${srcdir}/domain-list-community-${pkgver}"
    go run main.go
}

package() {
    cd "${srcdir}/domain-list-community-${pkgver}"
    install -Dm644 dlc.dat "${pkgdir}/usr/share/xray/geosite.dat"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
