# Maintainer:
# Contributor: Dct Mei <dctxmei@yandex.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: jakka <jakkadoujin at gmail dot com>
# Contributor: MrSedan <elpashevs at bk dot ru>

pkgname=xray-domain-list-community
pkgver=20251111115905
pkgrel=1
pkgdesc="A list of domains to be used as geosites for routing purpose in Project V"
arch=('any')
url="https://github.com/v2fly/domain-list-community"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('014a517c038baf0fb0b173e43d915e72b791f9a087aa5d2be8f1faa896a03edd')

build() {
  cd "${srcdir}/domain-list-community-${pkgver}"
  go run main.go
}

package() {
  cd "${srcdir}/domain-list-community-${pkgver}"
  install -Dm644 dlc.dat "${pkgdir}/usr/share/xray/geosite.dat"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
