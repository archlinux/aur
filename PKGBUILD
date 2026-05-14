# Maintainer: Mike Lei <mikelei@duck.com>
# Contributor: adityaphra <aditya.phra@gmail.com>

pkgname="sing-box-beta-bin"
_pkgver="1.14.0-alpha.23"
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
sha256sums_x86_64=("8dfad27db04006bd9a280a06e2867539f1082eeed9dbe3bcaab1ef9521af637d")
sha256sums_armv7h=("b86ca046429458c143bc5bdb9db49cc376c4749408a19a22484ca119fa68fa60")
sha256sums_aarch64=("3207caa469a4bdd21a12b1d13c69c8f8c378229db771febfac108f465e8dc6a7")
noextract=("${source_x86_64[@]%%::*}" "${source_armv7h[@]%%::*}" "${source_aarch64[@]%%::*}")

package() {
    bsdtar -C $pkgdir --exclude '.*' --zstd -xf "sing-box_${_pkgver}_linux_$CARCH.pkg.tar.zst"
}
