# Maintainer: MYT1 <MYT1 @ QQ .com>

pkgname=linkandroid-bin
_pkgname=LinkAndroid
pkgver=0.1.0
_pkgver=v0.1.0
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
source=("GPL-3.0")
source_x86_64=("https://github.com/modstart-lib/linkandroid/releases/download/$_pkgver/${_pkgname}-${pkgver}-linux-amd64.deb")
source_arm64=("https://github.com/modstart-lib/linkandroid/releases/download/$_pkgver/${_pkgname}-${pkgver}-linux-arm64.deb")
options=('!strip' '!debug')

sha256sums=('6b39c2445af52bf98c9fd3979b0a45f400178f2ec4ffd9188370c3ac6ae2e1f1')
sha256sums_x86_64=('dd123e3853e65eb88c93775bc9e115304fbd3e9aa4226f97e7661efe05427047')
sha256sums_arm64=('b7546427301c92b3e231f048e56d7e1368e4567ec6b9283aa4d09d705f6ce08d')

package() {
    bsdtar -xf "${srcdir}/data."* -C "$pkgdir/"
	install -Dm644 ${srcdir}/LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"          
}
