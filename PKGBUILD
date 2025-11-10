# Maintainer: Mike Lei <mikelei@duck.com>
# Contributor: adityaphra <aditya.phra@gmail.com>

pkgname="sing-box-beta-bin"
_pkgver="1.13.0-alpha.27"
pkgver="${_pkgver/-/\~}"
pkgrel="1"
pkgdesc="The universal proxy platform."
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
sha256sums_x86_64=("c60ed70daee85c902f46a9ee2f7b2530516141842d9c13f8a6dc9e68d479b751")
sha256sums_armv7h=("8f5bb149988181b0204c7e191a5fb42369a11e9a698d91a855f824ed515307e8")
sha256sums_aarch64=("e468aa1ad26a511e48173a80ca559da6dffcef7513faf0980b3f4631cc427ca9")
noextract=("${source_x86_64[@]%%::*}" "${source_armv7h[@]%%::*}" "${source_aarch64[@]%%::*}")

package() {
    tar -C $pkgdir --exclude '.*' --zstd -xf "sing-box_${_pkgver}_linux_$CARCH.pkg.tar.zst"
}
