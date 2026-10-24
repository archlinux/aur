# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname="sing-box-bin"
pkgver="1.14.4"
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
sha256sums_x86_64=('9e290349c8ad8ca4f1c67e42d09eb5af0b988537a8fe97ed715b1fa81b973f29')
sha256sums_armv7h=('090c4e9bb13f8d31609017ca2506288f927cab607dcfe1e437152bc51d84c19e')
sha256sums_aarch64=('6a299cc58a8f5660dd3f4cde8e6fb0ed2a014b7da48d22ab4747a0691cc12958')
noextract=("${source_x86_64[@]%%::*}" "${source_armv7h[@]%%::*}" "${source_aarch64[@]%%::*}")

package() {
    bsdtar -C "$pkgdir" --exclude '.*' --zstd -xf "sing-box_${pkgver}_linux_$CARCH.pkg.tar.zst"
}
