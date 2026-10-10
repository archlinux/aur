# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname="sing-box-bin"
pkgver="1.14.3"
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
sha256sums_x86_64=('bc60905166a029406081f9928e3a383df8cce3c8150af587617adf32c21f80a8')
sha256sums_armv7h=('7533c0029288d84fcbbfbd1a0e3f01ee1e7dac202205abab388ff6981e8ca207')
sha256sums_aarch64=('cb3e18a1e2466a13a60dc7a821d0202ad7a2e09b11554163e4d3f86db11a9e81')
noextract=("${source_x86_64[@]%%::*}" "${source_armv7h[@]%%::*}" "${source_aarch64[@]%%::*}")

package() {
    bsdtar -C $pkgdir --exclude '.*' --zstd -xf "sing-box_${pkgver}_linux_$CARCH.pkg.tar.zst"
}
