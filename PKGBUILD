# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.10.17
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
sha256sums=('939bde2e250a47cb40fa231d4da02226df8a7931c07f7bb02cc89f3c273ab947')
b2sums=('807ea9107291f0e297149b4d85a9486761bc673d0eda967e355177296b63b302d1ad45c6c7a54f9f6e5a715bfc18935b9856b41d88f4109067dfe0cfe3057775')

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
