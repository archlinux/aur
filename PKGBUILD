# Maintainer: MYT1 <MYT1 @ QQ .com>

pkgname=linkandroid-bin
_pkgname=LinkAndroid
pkgver=2.1.0
_pkgver=v2.1.0
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
sha256sums_x86_64=('adb1d5f72639036cf68a5d1c96d5efae052a58c3597c87fd697b4e08b40e8fb5')
sha256sums_arm64=('3bf96e41301b73990ded1cadb071c513ffc423138cd7c9c8b6a6ec2343fe0f79')

package() {
    bsdtar -xf "${srcdir}/data."* -C "$pkgdir/"
	install -Dm644 ${srcdir}/LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"          
}
