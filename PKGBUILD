# Maintainer: Mike Lei <mikelei@duck.com>
# Contributor: adityaphra <aditya.phra@gmail.com>

pkgname="sing-box-beta-bin"
_pkgver="1.14.0-alpha.28"
pkgver="${_pkgver/-/\~}"
pkgrel="1"
pkgdesc="The universal proxy platform (beta binary version)."
provides=("sing-box")
conflicts=("sing-box" "sing-box-bin" "sing-box-beta" "sing-box-git")
arch=("x86_64" "armv7h" "aarch64")
url="https://sing-box.sagernet.org/"
_git_url="https://github.com/SagerNet/sing-box"
license=("GPL-3.0-or-later")
backup=("etc/sing-box/config.json")
source_x86_64=("sing-box_${_pkgver}_linux_x86_64.pkg.tar.zst::$_git_url/releases/download/v$_pkgver/sing-box_${_pkgver}_linux_x86_64.pkg.tar.zst")
source_armv7h=("sing-box_${_pkgver}_linux_armv7h.pkg.tar.zst::$_git_url/releases/download/v$_pkgver/sing-box_${_pkgver}_linux_armv7hl.pkg.tar.zst")
source_aarch64=("sing-box_${_pkgver}_linux_aarch64.pkg.tar.zst::$_git_url/releases/download/v$_pkgver/sing-box_${_pkgver}_linux_aarch64.pkg.tar.zst")
sha256sums_x86_64=("5f637f5bc359fa9f7cbc998434a885ff4cc2e8ed2636fa9203644363f948928f")
sha256sums_armv7h=("3415c72370b610f5694fcbf19832d67728151d97a53090d41ada697ad01a9d55")
sha256sums_aarch64=("e15dabb668c7f7e3b90991e5ee3f2efca279ec5f183d01c3a8175fbb6d8b51ac")
noextract=("${source_x86_64[@]%%::*}" "${source_armv7h[@]%%::*}" "${source_aarch64[@]%%::*}")

package() {
    bsdtar -C $pkgdir --exclude '.*' --zstd -xf "sing-box_${_pkgver}_linux_$CARCH.pkg.tar.zst"
}
