# Maintainer: MYT1 <MYT1 @ QQ .com>

pkgname=linkandroid-bin
_pkgname=LinkAndroid
pkgver=0.6.0
_pkgver=v0.6.0
pkgrel=1
pkgdesc='全能手机连接助手,简单 高清投屏,多设备,USB/无线连接,录屏 MP4/GIF录屏,截屏美化,命令行,强大 文件管理,键盘鼠标OTG,应用管理。'
arch=('x86_64' 'arm64')
url="https://linkandroid.com/"
license=('GPL-3.0')
depends=(
    'hicolor-icon-theme'
    'gtk3'
    'libnotify'
    'nss'
    'libxss'
    'libxtst'
    'xdg-utils'
    'at-spi2-core'
    'util-linux-libs'
    'libsecret'
    'libappindicator-gtk3')
source=("LICENSE")
source_x86_64=("https://github.com/modstart-lib/linkandroid/releases/download/$_pkgver/${_pkgname}-${pkgver}-linux-amd64.deb")
source_arm64=("https://github.com/modstart-lib/linkandroid/releases/download/$_pkgver/${_pkgname}-${pkgver}-linux-arm64.deb")
options=('!strip' '!debug')

sha256sums=('6b39c2445af52bf98c9fd3979b0a45f400178f2ec4ffd9188370c3ac6ae2e1f1')
sha256sums_x86_64=('7488014b9ee5bac5b012d23713034a6c5b392455a50c49f00ee3331e2ddfadb8')
sha256sums_arm64=('703b39b965f4186b6f3fbf314c90ccfe9620c7dcad4d5839b7df1caa209ff12d')

package() {
    bsdtar -xf "${srcdir}/data."* -C "$pkgdir/"
	install -Dm644 ${srcdir}/LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"          
}
