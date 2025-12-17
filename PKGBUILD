# Maintainer: TheWinds071 <you@example.com>

pkgname=serial-mate
pkgver=1.3.7
pkgrel=1
pkgdesc="一个串口调试助手（Wails + Vue3）"
arch=('x86_64')
url="https://github.com/TheWinds071/serial-mate"
license=('GPL-3.0-only')
depends=(
  # Wails Linux runtime typically needs webkit2gtk and gtk3.
  # 如果你测试发现缺少依赖（运行报错），再补充。
  'gtk3'
  'webkit2gtk'
)
provides=('serial-mate')
conflicts=()

source=(
  "$pkgname-$pkgver-linux-amd64.tar.gz::https://github.com/TheWinds071/serial-mate/releases/download/v$pkgver/serial-mate-$pkgver-linux-amd64.tar.gz"
  "serial-mate.desktop"
  # 使用仓库里的 pict.png 作为图标（你也可以换成专用 icon 文件）
  "serial-mate.png::https://raw.githubusercontent.com/TheWinds071/serial-mate/refs/heads/master/build/appicon.png"
)

sha256sums=(
  '922a600ffb45b101e17404f3c03fcccebb11e771ff9742150ae9f04e509fff38'  # TODO: replace with sha256 of tar.gz
  'e2d6394df5a6f82f69bee7a95faccb3db0afbf872f566a312350e4bf60b1c2b9'  # TODO: replace with sha256 of serial-mate.desktop
  '956031a0bd464c898d514ae8d66fb317308dcef1198e3ab2486d7b5e137f8361'  # TODO: replace with sha256 of pict.png
)

package() {
  # binary
  install -Dm755 "serial-mate" "$pkgdir/usr/bin/serial-mate"

  # desktop entry
  install -Dm644 "$srcdir/serial-mate.desktop" \
    "$pkgdir/usr/share/applications/serial-mate.desktop"

  # icon
  install -Dm644 "$srcdir/serial-mate.png" \
    "$pkgdir/usr/share/pixmaps/serial-mate.png"
}
