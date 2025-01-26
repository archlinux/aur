# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.12.12
pkgrel=1
pkgdesc='wayland application runner'
url='https://github.com/abenz1267/walker'
arch=('x86_64')
license=('MIT')
makedepends=('go' 'gobject-introspection')
depends=('gtk4-layer-shell' 'libvips' 'ffmpeg')
optdepends=('wl-clipboard: for clipboard module' 'libqalculate: for calculator module')
conflicts=('walker')
provides=('walker')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2646212b2a7fddc5102fa2a90d29c71bb8e1109a678888be765dc47f889b0179')
b2sums=('7763b32fd4b50377b230022088bbafd5a038af3d6eefe6a6d94f2b8cb7709432baf280a4cd626dc4bd11d18682b07025295f500c07b8b94ccaa7092c89c4dc43')

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
