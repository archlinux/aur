# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=zenith-bin
pkgver=0.14.1
pkgrel=1
pkgdesc="Terminal system monitor with histograms, written in Rust"
arch=('x86_64')
url="https://github.com/bvaisvil/zenith"
license=('MIT')
provides=('zenith')
conflicts=('zenith')
optdepends=('nvidia-utils')
source=("${url}/releases/download/${pkgver}/zenith_${pkgver}-1_amd64.deb")
sha256sums=('f171399cdd18658faafeb890d8dd6c90444bbc73b005b09aacec6367ddd937d0')

package() {
  # extract package data
  tar xf "data.tar.xz"

  # binary
  install -Dm 755 {,"$pkgdir"/}usr/bin/zenith

  # license
  install -Dm 644 'usr/share/doc/zenith/copyright' "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # desktop icon and entry
  install -Dm 644 {,"$pkgdir"/}usr/share/pixmaps/zenith.png
  install -Dm 644 {,"$pkgdir"/}usr/share/applications/zenith.desktop
}
