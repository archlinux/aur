# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=lunchpad-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Macro application for Novation Launchpads"
arch=('x86_64' 'aarch64')
url="https://github.com/ruohki/lunchpad"
license=('GPL-3.0-only')
depends=('alsa-lib' 'cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgcc' 'libsoup3' 'libspeechd' 'webkit2gtk-4.1')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/Lunchpad_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/Lunchpad_${pkgver}_linux_aarch64.tar.gz")
sha256sums_x86_64=('677908540c5bc7f5bb22e1969d2f8d4191de4bc1eb8476d11144d73ebcedceff')
sha256sums_aarch64=('468265b8ea5aa780ea7162927b3be0b170649703ce3a230312fb9ac779bff4ac')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="Lunchpad_${pkgver}_linux_x86_64" ;;
    aarch64) _dir="Lunchpad_${pkgver}_linux_aarch64" ;;
  esac
  install -Dm755 "${_dir}/lunchpad" "${pkgdir}/usr/bin/lunchpad"
  install -Dm644 "${_dir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
