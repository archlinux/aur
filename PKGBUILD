# Maintainer: Theodore Huang <teddyhuangnan@gmail.com>
# Contributor: Antoni Marzec <marzeqmarzeq at gmail dot com>

_basename=koharu
pkgname=${_basename}-bin
pkgver=0.61.1
pkgrel=1
pkgdesc="Manga translation tools"
arch=("x86_64")
url="https://github.com/mayocream/koharu"
license=("GPL-3.0")
depends=()
provides=("$_basename")
conflicts=("$_basename")
options=("!debug")

_execname="${_basename}-${pkgver}"

source=(
  "$_execname::https://github.com/mayocream/koharu/releases/download/${pkgver}/koharu_linux_x64"
  "koharu.desktop"
  "koharu.png"
)

sha256sums=('2119a10a893946d65637fc7c397fee6f569c50137fc17d70e4023785acb13625'
            'cf0fde21f3a870444960834d8f321bc785e7848e3852c2d844f3c70d66f6b54b'
            '31a76300030d9ae3e855180165966f76f710a9282cbb38796b5869881712eef0')

package() {
  install -Dm755 "$srcdir/$_execname" "$pkgdir/usr/bin/$_basename"

  install -Dm644 "$srcdir/koharu.desktop" \
    "$pkgdir/usr/share/applications/koharu.desktop"

  install -Dm644 "$srcdir/koharu.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/koharu.png"
}
