# Maintainer: MYT1 <MYT1 @ QQ .com>
pkgname=uotantoolbox_linux-bin
_pkgname=UotanToolbox_Linux
pkgver=3.2.1
pkgrel=1
pkgdesc='鱼滩工具箱,为玩机发烧友而生  支持OpenHarmony和HarmonyOS NEXT设备'
arch=('x86_64' 'arm64' 'loong64')
url="https://toolbox.uotan.cn/"
license=('GPL-3.0')
depends=(
    'usbutils'
    'android-tools')
source=("LICENSE.txt")
source_x86_64=("https://github.com/Uotan-Dev/UotanToolboxNT/releases/download/$pkgver/${_pkgname}_x64_$pkgver.deb")
source_arm64=("https://github.com/Uotan-Dev/UotanToolboxNT/releases/download/$pkgver/${_pkgname}_arm64_$pkgver.deb")
source_loong64=("https://github.com/Uotan-Dev/UotanToolboxNT/releases/download/$pkgver/${_pkgname}_loong64_$pkgver.deb")

sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('b458d0e160d30dc584c605a290acfcbf6089aa67b9cafd685753baaefe3f282f')
sha256sums_arm64=('708bd7714a7ef2f2fc52980b326ccd6b2aae84c7d4adb2c176b85bc401161179')
sha256sums_loong64=('c9781d33d6ddf114b98f6aad34042e6d24d99cca16b1b728e54accc2361ca212')
options=('!strip' '!debug')

package() {
    bsdtar -xf "${srcdir}/data."* -C "$pkgdir/"
     install -Dm644 ${srcdir}/LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
