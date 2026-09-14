# Maintainer: Mike Lei <mikelei@duck.com>
# Contributor: adityaphra <aditya.phra@gmail.com>

pkgname="sing-box-beta-bin"
_pkgver="1.15.0-alpha.3"
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
sha256sums_x86_64=("f7b8d47f003b7a98c754a8086de717f9fe670bcc622cd70c402b71bf007d9bd6")
sha256sums_armv7h=("778a3e17f3a138ca4798cbe790fb6880d421824772bf2bac57b6b6ee2dccf718")
sha256sums_aarch64=("13254a36724ad8e7bb83cfe14fe089640cb76d689fafbc67fd1088564658f580")
noextract=("${source_x86_64[@]%%::*}" "${source_armv7h[@]%%::*}" "${source_aarch64[@]%%::*}")

package() {
    bsdtar -C $pkgdir --exclude '.*' --zstd -xf "sing-box_${_pkgver}_linux_$CARCH.pkg.tar.zst"
}
