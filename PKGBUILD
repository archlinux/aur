# Maintainer:
# Contributor: Dct Mei <dctxmei@yandex.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: jakka <jakkadoujin at gmail dot com>
# Contributor: MrSedan <elpashevs at bk dot ru>

pkgname=xray-domain-list-community
pkgver=20251020145026
pkgrel=1
pkgdesc="A list of domains to be used as geosites for routing purpose in Project V"
arch=('any')
url="https://github.com/v2fly/domain-list-community"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('5993eb2f2196ecf10ade55b6be5610f0a8d5f679236cb41c341c52c6d5a58e23')

build() {
  cd "${srcdir}/domain-list-community-${pkgver}"
  go run main.go
}

package() {
  cd "${srcdir}/domain-list-community-${pkgver}"
  install -Dm644 dlc.dat "${pkgdir}/usr/share/xray/geosite.dat"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
