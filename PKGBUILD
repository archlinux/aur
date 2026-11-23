pkgname=pulse-egoist-bin
pkgver=0.1.31
pkgrel=1
pkgdesc='Everything your computer is doing, in one calm window.'
arch=('x86_64' 'aarch64')
url='https://pulse.egoist.dev'
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
source_x86_64=("https://github.com/egoist/pulse-feedback/releases/download/v${pkgver}/pulse_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/egoist/pulse-feedback/releases/download/v${pkgver}/pulse_${pkgver}_arm64.deb")
sha256sums_x86_64=('62edb6fa31beb0ae9bfd094c991191f7889b30115f361f28127b5522b09197ad')
sha256sums_aarch64=('48755cfd90cb6c64760667f7784cbc5a2b43a919a27b82cef41b82a524e32a4c')

package() {
  cd "$srcdir"
  local _deb_arch=amd64
  [[ $CARCH == aarch64 ]] && _deb_arch=arm64
  bsdtar -xf "pulse_${pkgver}_${_deb_arch}.deb"
  bsdtar -xf data.tar.gz -C "$pkgdir"
}
