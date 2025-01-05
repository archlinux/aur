# Maintainer: MYT1 <MYT1 @ QQ .com>
pkgname=uotantoolbox_linux-bin
_pkgname=UotanToolbox_Linux
pkgver=3.3.0
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
sha256sums_x86_64=('45c44773739ce35dc165cbce907b79e458d578578b892c864ec977ea598410fd')
sha256sums_arm64=('76ab9f217a37d76d6de3e60284c420d4cef91f03f57c5ee0f6bb8ed0ee4caae8')
sha256sums_loong64=('baac26c3f3adccbfdc70976259919c41566cb3589e8c4c14dec9ebdafab98937')
options=('!strip' '!debug')

package() {
    bsdtar -xf "${srcdir}/data."* -C "$pkgdir/"
    sed -i '5i\Name[zh_CN]=柚坛工具箱' "$pkgdir/usr/share/applications/UotanToolbox.desktop"
    install -Dm644 ${srcdir}/LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
