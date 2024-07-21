# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.1.5
pkgrel=1
pkgdesc='wayland application runner'
url='https://github.com/abenz1267/walker'
arch=('x86_64')
license=('MIT')
makedepends=('go')
depends=('gtk4-layer-shell')
optdepends=('wl-clipboard: for clipboard module')
conflicts=('walker')
provides=('walker')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b476b7089b12eaf344f9ea9c266eebd60178cb94e472a0a30acd4bc852630d53')
b2sums=('9fff78e9a10baf4003d952bb092a3634921c0db664af63c034f9be65ccec193b9a13f0c95127dce2a1e9ea502625dfe4cc3d3026459151f390822b0297bc82eb')

build() {
  cd ${pkgname}-${pkgver}

  go build -x
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 walker -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
