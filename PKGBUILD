# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Tsingv <tsingv@outlook.com>
pkgname=("omniedge-cli")
pkgver=0.2.2
pkgrel=3
epoch=
pkgdesc="A reliable and painless connectivity to all your devices in one click."
arch=("x86_64" "aarch64" "armv7h")
url="https://omniedge.io/"
license=()
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source_x86_64=("omniedgecli-${pkgver}-amd64.zip::https://github.com/omniedgeio/app-release/releases/download/v${pkgver}/omniedgecli-amd64.zip")
source_aarch64=("omniedgecli-${pkgver}-arm64v8.zip::https://github.com/omniedgeio/app-release/releases/download/v${pkgver}/omniedgecli-arm64v8.zip")
source_armv7h=("omniedgecli-${pkgver}-amdv7.zip::https://github.com/omniedgeio/app-release/releases/download/v${pkgver}/omniedgecli-armv7.zip")
noextract=()
sha512sums_x86_64=('36fad9ea1fe61cabb62597e9b6f933a2571265dcb91fc13beba8d80658543d47cd59340dbac92a6e7fb1b2da1bea9996f962207bfd043a1bef995e07c1b613a2')
sha512sums_aarch64=('faabdf0d89bf56531bcd172e013b1e99fa0a6500d7129cd3904e64784356ceedfaff92d4edc1af53d05f117aa5d1643767e142d4fb8379a63c6539463043ff94')
sha512sums_armv7h=('ec30b874dd7981cc1d313d1f8c7af4d656ab5a0287ad2984fb6e9c16015a54d1faf5b278b6131cc529b2097d63ef7ea5612de3170b428995ae4a5b950101806b')
validpgpkeys=()

package() {
    install -d "${pkgdir}/opt/omniedge-cli"
    install -d "${pkgdir}/usr/bin"
    install -D -m 0755 omniedge "${pkgdir}/opt/omniedge-cli/omniedge"
    ln -s /opt/omniedge-cli/omniedge ${pkgdir}/usr/bin/omniedge
    # I have not idea to use ${pkgdir} twice, only one works fine.
}
