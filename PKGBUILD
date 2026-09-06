# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname="sing-box-bin"
pkgver="1.14.0"
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
sha256sums_x86_64=('64f7d74b89e8f01c03491e54fcbd435679c0b248556fc3cda985e9bb7227a242')
sha256sums_armv7h=('f9a2a36dd0de0a580ce2fface331fc95586cf3be528bbc10759f0c9b34d31803')
sha256sums_aarch64=('74325ffcc025d682827c23eb14e0edae64aa85362d652bdf2b2e1e9c7e395794')
noextract=("${source_x86_64[@]%%::*}" "${source_armv7h[@]%%::*}" "${source_aarch64[@]%%::*}")

package() {
    bsdtar -C $pkgdir --exclude '.*' --zstd -xf "sing-box_${pkgver}_linux_$CARCH.pkg.tar.zst"
}
