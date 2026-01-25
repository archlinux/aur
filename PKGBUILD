# Maintainer: MYT1 <MYT1 @ QQ .com>
pkgname=uotantoolbox_linux-bin
_pkgname=UotanToolbox_Linux
pkgver=3.5.0
epoch=1
pkgrel=1
pkgdesc='鱼柚坛工具箱 NT,为玩机发烧友而生。'
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
sha256sums_x86_64=('17d8d6179d67ba7177406b23463e7cb0fffcfcd8d11149063bd94ab19f760f24')
sha256sums_arm64=('db98dcbd19dc961b0b8343e677b0a2b093325dbbaa019a4c5721cac0ea9e33a7')
sha256sums_loong64=('abb0884ad56b30a885cca4d587aed0d2006ba96da90046634580821ab4a915e3')
options=('!strip' '!debug')

package() {
    bsdtar -xf "${srcdir}/data."* -C "$pkgdir/"
    sed -i '5i\Name[zh_CN]=柚坛工具箱' "$pkgdir/usr/share/applications/UotanToolbox.desktop"
    install -Dm644 ${srcdir}/LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
