# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Tsingv <tsingv@outlook.com>
pkgname=("omniedge-cli")
pkgver=0.2.3
pkgrel=1
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
source_x86_64=("omniedgecli-${pkgver}-amd64.zip::https://github.com/omniedgeio/app-release/releases/download/v${pkgver}/omniedgecli-amd64.zip" "omniedge.service")
source_aarch64=("omniedgecli-${pkgver}-arm64v8.zip::https://github.com/omniedgeio/app-release/releases/download/v${pkgver}/omniedgecli-arm64v8.zip" "omniedge.service")
source_armv7h=("omniedgecli-${pkgver}-amdv7.zip::https://github.com/omniedgeio/app-release/releases/download/v${pkgver}/omniedgecli-armv7.zip" "omniedge.service")
noextract=()
sha512sums_x86_64=('1aea5d569f01f1616cb08698da61d1a608bb34044423a53be0e7c907bd0c4aee18595cc70590f813cf8c1dca4405e4b3dd3f09733eb7065a6fa350aa271df77b' 'a0626f871b294627802c29af8e1ff5577c629eb52eaede340780e1ce37c2a911908bad3b905f27fa054cffdffe1f1e1dbd16c31e194f4516e91f5008304f79ef')
sha512sums_aarch64=('b1fb328de0f7ec64f44f8831ab042b1b218d1fe4cc357aff9ee7f87dc18e3e49ac959dc6d69cfb5e87ad483c5a376f38061b2922beda1b6fc6b47a86fc713bb6' 'a0626f871b294627802c29af8e1ff5577c629eb52eaede340780e1ce37c2a911908bad3b905f27fa054cffdffe1f1e1dbd16c31e194f4516e91f5008304f79ef')
sha512sums_armv7h=('88ffff48c2b79609555e06dc924dcc4285fadb3f9b103617dd96967af3283c73482d7ae2a700cc19686a5a01e5fa075ddd3b8aac99cb4ba8c43d09b651a381b6' 'a0626f871b294627802c29af8e1ff5577c629eb52eaede340780e1ce37c2a911908bad3b905f27fa054cffdffe1f1e1dbd16c31e194f4516e91f5008304f79ef')
validpgpkeys=()

package() {
    install -d "${pkgdir}/opt/omniedge-cli"
    install -d "${pkgdir}/usr/bin"
    install -D -m 0755 omniedge "${pkgdir}/opt/omniedge-cli/omniedge"
    install -D -m 0644 omniedge.service "${pkgdir}/opt/omniedge-cli/omniedge.service"
    ln -s /opt/omniedge-cli/omniedge ${pkgdir}/usr/bin/omniedge
    # I have not idea to use ${pkgdir} twice, only one works fine. like `ln -s ${pkgdir}/opt/omniedge-cli/omniedge ${pkgdir}/usr/bin/omniedge`
}
