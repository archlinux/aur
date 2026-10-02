# AUR: linux-danmu-hime（预编译版，直接拉 GitHub release，本地不需要编 Rust）
pkgname=linux-danmu-hime
pkgver=0.1.0
pkgrel=1
pkgdesc="bilibili 直播弹幕浮层（wlr-layer-shell）+ GTK4 设置界面（预编译）"
# 只提供 x86_64 的 release 资产；aarch64 得从源码编（见仓库 README）
arch=('x86_64')
url="https://github.com/SHORiN-KiWATA/linux-danmu-hime"
license=('MIT')
depends=('glibc' 'gcc-libs' 'fontconfig' 'wayland' 'libxkbcommon' 'gtk4' 'libadwaita' 'python-gobject' 'python-cairo' 'systemd')
optdepends=('qrencode: 扫码登录显示二维码' 'noto-fonts-emoji: 彩色 emoji')
provides=('danmu-hime')
# 预编译包：不生成 -debug，也不必再管 makepkg.conf 里的 LTO 开关
options=('!debug')
source=("danmu-hime-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/danmu-hime-$pkgver-x86_64.tar.gz")
sha256sums=('2124e90d3f7df62b6833a2b1c978b0a7be2fdaf7573dea08f0c528abb882e789')

package() {
  # 资产里就是完整的文件树（usr/bin、usr/lib/linux-danmu-hime、桌面项、图标、systemd 单元、LICENSE）
  cp -a "$srcdir/danmu-hime-$pkgver/usr" "$pkgdir/"
}
