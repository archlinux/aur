# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.10.19
pkgrel=1
pkgdesc='wayland application runner'
url='https://github.com/abenz1267/walker'
arch=('x86_64')
license=('MIT')
makedepends=('go' 'gobject-introspection')
depends=('gtk4-layer-shell' 'libvips')
optdepends=('wl-clipboard: for clipboard module' 'libqalculate: for calculator module')
conflicts=('walker')
provides=('walker')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2e3033c02c0733d5bef2ec8833a68795f3390a7f5eb0c3ad8618965401b6e72c')
b2sums=('390a2c556af30e5a6b4f73cd8cdf97160090a448c415ccf66a7b8c14ddfe936c89953f7fd1a737614da7c1e9f291dcda052354dcae47ef685de74eae6ec44584')

build() {
  cd ${pkgname}-${pkgver}/cmd

  go build -x -o walker
}

package() {
  cd ${pkgname}-${pkgver}/cmd
  install -Dm 755 walker -t "${pkgdir}/usr/bin"

  cd ../
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
