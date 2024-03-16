# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.0.21
pkgrel=1
pkgdesc='wayland application runner'
url='https://github.com/abenz1267/walker'
arch=('x86_64')
license=('MIT')
makedepends=('go')
depends=('gtk4-layer-shell')
conflicts=('walker')
provides=('walker')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('de768d8a8b86e5d64598a81bcc0c2e5988e05d1498c328f6378417e9ff4d335b')
b2sums=('562babe54c27908ded56eea0a7aa8d53a7341fef24f0956ef2dc5009fd3e6a911bd5b6c649384b1fd8efff68890bb18ec46c3a4886c9d15ac900e8e9a43c3064')

build() {
  cd ${pkgname}-${pkgver}

  go build
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 walker -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
