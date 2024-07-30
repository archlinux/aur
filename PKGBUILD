# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.5.5
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
sha256sums=('fd8706cc5db8f413e32a2ca9fde6704855d9e2961fc269174ae56cc54e3141cd')
b2sums=('6674ea7eb1a3eb9918b1d827cc0aa3f82fd82f3b3539b7e6e6e98423da68e271dc3c23d1d6d258db86410b0e24bc1d86c81cbc56cff3da49ff846f4b855bc3d9')

build() {
  cd ${pkgname}-${pkgver}

  go build -x
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 walker -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
