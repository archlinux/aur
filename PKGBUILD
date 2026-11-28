# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname="sing-box-bin"
pkgver="1.14.6"
pkgrel="1"
pkgdesc="The universal proxy platform (binary version)"
provides=("sing-box")
conflicts=("sing-box")
optdepends=("sing-geosite-rule-set: GeoSite rule sets"
            "sing-geoip-rule-set: GeoIP rule sets")
arch=("x86_64" "armv7h" "aarch64")
url="https://sing-box.sagernet.org"
license=("GPL-3.0-or-later" "LicenseRef-sing-box-exception")
backup=("etc/sing-box/config.json")
install="sing-box-bin.install"
_github_url="https://github.com/SagerNet/sing-box"
source_x86_64=("sing-box_${pkgver}_linux_x86_64.pkg.tar.zst::$_github_url/releases/download/v$pkgver/sing-box_${pkgver}_linux_x86_64.pkg.tar.zst")
source_armv7h=("sing-box_${pkgver}_linux_armv7h.pkg.tar.zst::$_github_url/releases/download/v$pkgver/sing-box_${pkgver}_linux_armv7hl.pkg.tar.zst")
source_aarch64=("sing-box_${pkgver}_linux_aarch64.pkg.tar.zst::$_github_url/releases/download/v$pkgver/sing-box_${pkgver}_linux_aarch64.pkg.tar.zst")
sha256sums_x86_64=('e19412688cfcfba6322b494bb2b1be57243d710c4dd0b3cfadcf2d59ab6c6d1d')
sha256sums_armv7h=('2692592d8b1c4be8e147e433724240fc1c722d20af2c55ef129999973d6632bd')
sha256sums_aarch64=('ff7844bd9536d204f597a26bf9167f9900d3be8ba06935abb94323bfeaf636f4')
noextract=("${source_x86_64[@]%%::*}" "${source_armv7h[@]%%::*}" "${source_aarch64[@]%%::*}")

package() {
    bsdtar -C "$pkgdir" --exclude '.*' --zstd -xf "sing-box_${pkgver}_linux_$CARCH.pkg.tar.zst"
}
