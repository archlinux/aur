# Maintainer: MYT1 <MYT1 @ QQ .com>
pkgname=uotantoolbox_linux-bin
_pkgname=UotanToolbox_Linux
pkgver=3.7.0
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
sha256sums_x86_64=('38c654184820f7e5a5bb4b8d56609af95da791213e9aa5076ca76edf38b4fa3c')
sha256sums_arm64=('7e0f58281bf37fec6c6360c6f9acbfc5d01d66bbc8d64c7cc46e02833cd14057')
sha256sums_loong64=('ef758b4de3f991cb36f1f5a2f881857cf4e75c4c06ac1e484f808a864a36f301')
options=('!strip' '!debug')

package() {
    bsdtar -xf "${srcdir}/data."* -C "$pkgdir/"
    sed -i '5i\Name[zh_CN]=柚坛工具箱' "$pkgdir/usr/share/applications/UotanToolbox.desktop"
    install -Dm644 ${srcdir}/LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
