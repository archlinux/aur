# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.7.2
pkgrel=1
pkgdesc='wayland application runner'
url='https://github.com/abenz1267/walker'
arch=('x86_64')
license=('MIT')
makedepends=('go')
depends=('gtk4-layer-shell')
optdepends=('wl-clipboard: for clipboard module' 'libqalculate: for calculator module')
conflicts=('walker')
provides=('walker')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('80588c08b6f8fca04f47f6901ff671bb50d2611563e4f2405fd7580e80c6feaf')
b2sums=('eae50c6e1e8fac3b5f1c0fdf9082a06940452ac161d9e6017bf33b7bdb5c37f60f5c9e817b0ac19633f8d6f48153aa69c211e33ff79cc3387835a6351bbca6ea')

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
