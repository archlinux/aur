# Maintainer: nitaiishi__Lereo <3653615194@qq.com>

pkgname=todesk-appimage
pkgver=4.8.5.1
pkgrel=1
pkgdesc="ToDesk remote desktop - AppImage version with full service support (unofficial build)"
arch=('x86_64')
url="https://github.com/nitaishi520/todesk-appimage"
license=('custom:proprietary')
depends=('libxcb' 'libxrandr' 'libxrender' 'libgl' 'libx11' 'libxtst')
makedepends=('wget' 'tar')
provides=('todesk')
conflicts=('todesk' 'todesk-bin')
source=("https://github.com/nitaishi520/todesk-appimage/releases/download/v$pkgver/ToDesk-v$pkgver-amd64.AppImage")
sha256sums=('SKIP')

package() {
  # 安装主程序
  install -Dm755 "ToDesk-v$pkgver-amd64.AppImage" "$pkgdir/usr/bin/todesk"
  
  # 创建 desktop 文件
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/todesk.desktop" << EOF
[Desktop Entry]
Name=ToDesk
Comment=ToDesk Remote Desktop
Exec=todesk
Icon=todesk
Type=Application
Categories=Network;
StartupWMClass=ToDesk
EOF

  # 创建图标（先用空文件，以后可以加）
  touch todesk.png
  install -Dm644 todesk.png "$pkgdir/usr/share/pixmaps/todesk.png"
}
