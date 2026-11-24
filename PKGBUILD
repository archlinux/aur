# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rustune-bin
pkgver=0.3.8
pkgrel=1
pkgdesc="Terminal music player with YouTube search and local playback"
arch=('x86_64' 'aarch64')
url="https://github.com/dzulfikar08/rustune"
license=('MIT')
depends=('alsa-lib' 'glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/rustune-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/rustune-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('ee28cd13292202d6f00788e844ebaf4a3b64cba154613d85a72d41eb4dd126c5')
sha256sums_aarch64=('a6f4ec5f8e479070743cef1c02d04c7125652da4fe6330c3d2d697e6a93a6284')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="rustune-${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="rustune-${pkgver}-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/rustune" "${pkgdir}/usr/bin/rustune"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
