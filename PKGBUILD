# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Tsingv <tsingv@outlook.com>
pkgname=("omniedge-cli")
pkgver=0.2.2
pkgrel=4
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
sha512sums_x86_64=('4d48459afc2d88709e966e79b2700f2fa0b18d96400b5c4c133d84bf902d61459d86dcd37f9be3833ba7937d5e6ae35ed13ca66ec13258a30581f480e83af8f0')
sha512sums_aarch64=('36db294dc172d4c8f31032b4626128bbc4116a2ee01bd7f720e5d3de421d32e5c97cad77353652e688ea07e404ac9064f5a867c9b7c154edafe29f1c425f79ed')
sha512sums_armv7h=('dc0b82bd14bfb23a495511a229935f2cc481c66809f430f92b6f92a34982bf842befd50982946c7b93427ca16ce3911997ad350e0002917b1a3fbca003f3659c')
validpgpkeys=()

package() {
    install -d "${pkgdir}/opt/omniedge-cli"
    install -d "${pkgdir}/usr/bin"
    install -D -m 0755 omniedge "${pkgdir}/opt/omniedge-cli/omniedge"
    ln -s /opt/omniedge-cli/omniedge ${pkgdir}/usr/bin/omniedge
    # I have not idea to use ${pkgdir} twice, only one works fine.
}
