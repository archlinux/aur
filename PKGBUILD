# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.11.17
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
sha256sums=('a4aa99d75204470eb9226e123d667b17e40139d810163f542463a0bf8d705960')
b2sums=('39f06f7e9258ed24e285b6eff084e1c8c117bda13910ed67cef2e41095067cff491c5d7f72e15229b05f2a8f1f8ce03c57e4e381b20fdb9db77c77e920b2cb56')

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
