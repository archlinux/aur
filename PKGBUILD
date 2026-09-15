# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname="sing-box-bin"
pkgver="1.14.1"
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
sha256sums_x86_64=('5ce570afe16174a883b5f370a01ffe02652271c0d4f3f255384738f1fde651ee')
sha256sums_armv7h=('8a1112a5bcbc51baabd30268efe0a03e18e62b79ba3d00e727fe3877c2e564c4')
sha256sums_aarch64=('ee8428a978039798a9c732f5680655f19ebf58a4773cde64cc7ccb254d3eaaa6')
noextract=("${source_x86_64[@]%%::*}" "${source_armv7h[@]%%::*}" "${source_aarch64[@]%%::*}")

package() {
    bsdtar -C $pkgdir --exclude '.*' --zstd -xf "sing-box_${pkgver}_linux_$CARCH.pkg.tar.zst"
}
