# Maintainer:
# Contributor: Dct Mei <dctxmei@yandex.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: jakka <jakkadoujin at gmail dot com>

pkgname=xray-domain-list-community
pkgver=20241112092643
pkgrel=1
pkgdesc="A list of domains to be used as geosites for routing purpose in Project V"
arch=('any')
url="https://github.com/v2fly/domain-list-community"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('098babe3101901243741c82fcc4c6774570b336cbc7b876a7b34e5bd42fe936c')

build() {
    cd "${srcdir}/domain-list-community-${pkgver}"
    go run main.go
}

package() {
    cd "${srcdir}/domain-list-community-${pkgver}"
    install -Dm644 dlc.dat "${pkgdir}/usr/share/xray/geosite.dat"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
