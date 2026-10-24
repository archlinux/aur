pkgname=pulse-egoist-bin
pkgver=0.1.29
pkgrel=1
pkgdesc='Everything your computer is doing, in one calm window.'
arch=('x86_64' 'aarch64')
url='https://pulse.egoist.dev'
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
source_x86_64=("https://github.com/egoist/pulse-feedback/releases/download/v${pkgver}/pulse_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/egoist/pulse-feedback/releases/download/v${pkgver}/pulse_${pkgver}_arm64.deb")
sha256sums_x86_64=('66734e8ad7b6ac7a7e930b89722be2e457a779e3c12f1ddd28c940ad8f6b1ca7')
sha256sums_aarch64=('b74857068186230d7a779e270337cb9f69e11daf0277609c691a13a297b170a4')

package() {
  cd "$srcdir"
  local _deb_arch=amd64
  [[ $CARCH == aarch64 ]] && _deb_arch=arm64
  bsdtar -xf "pulse_${pkgver}_${_deb_arch}.deb"
  bsdtar -xf data.tar.gz -C "$pkgdir"
}
