# Maintainer: Mike Lei <mikelei@duck.com>
# Contributor: adityaphra <aditya.phra@gmail.com>

pkgname="sing-box-beta-bin"
_pkgver="1.14.0-alpha.1"
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
sha256sums_x86_64=("e2a05917c53ff01d3434ef1a5843d77c3014bd16a63cf8123e12e9fd822ee72d")
sha256sums_armv7h=("3b0db18e43963898fb98706b616b1b4a787f01c1867f77be14cf1ad131f75201")
sha256sums_aarch64=("99369ff7df10e50b1861181ee61dec168f53869b72f2531fc2bad91af9de2965")
noextract=("${source_x86_64[@]%%::*}" "${source_armv7h[@]%%::*}" "${source_aarch64[@]%%::*}")

package() {
    bsdtar -C $pkgdir --exclude '.*' --zstd -xf "sing-box_${_pkgver}_linux_$CARCH.pkg.tar.zst"
}
