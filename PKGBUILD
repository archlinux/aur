# Maintainer: Lorenzo Golluscio <149246609+ssupt@users.noreply.github.com>

pkgname=drmcru-bin
_pkgname=drmcru
pkgver=0.1.3
pkgrel=1
pkgdesc="Linux DRM/KMS custom resolution and EDID override utility"
arch=('x86_64')
url="https://github.com/ssupt/drmcru"
license=('GPL-3.0-or-later')
provides=("drmcru=${pkgver}")
conflicts=('drmcru')
optdepends=(
  'hyprland: live mode discovery, switching, and verification'
  'polkit: pkexec authentication for automatic Apply/Uninstall'
  'mkinitcpio: initramfs integration for automatic Apply/Uninstall'
  'limine: supported bootloader for automatic Apply/Uninstall'
  'limine-mkinitcpio: Limine entry regeneration on Omarchy-style systems'
)
options=('!strip' '!debug')
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-musl")
sha256sums_x86_64=('8507a68e93ab9846e31a7d90644b4307e3bf7198737f999db337163cc44fa29b')

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
