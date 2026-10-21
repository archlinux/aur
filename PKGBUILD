# Maintainer: safalski
pkgname=ryuski-bin
_pkgname=ryuski
pkgver=0.0.4
pkgrel=1
pkgdesc="Local, trainable command assistant with a CLI and QML plugin (prebuilt binary)"
arch=('x86_64')
url="https://github.com/RyuZinOh/ryuSki"
license=('BSD-2-Clause')
depends=('sqlite' 'qt6-declarative')
optdepends=(
  'kitty: default terminal for "go to <folder>" (override with $TERMINAL)'
  'libpulse: paplay, needed for spoken replies'
  'piper-tts: spoken replies (AUR, needs a Piper voice at ~/.local/share/ryuski/voice/ryuski.onnx)'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!debug')
install=ryuski.install
source=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.tar.gz")
sha256sums=('53c54dc59a0f7fdafd2090272201ca246f332126ba3ea651692f67638f9d5062')

package() {
  cp -a usr "$pkgdir/"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  mv "$pkgdir/usr/share/licenses/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rmdir "$pkgdir/usr/share/licenses/$_pkgname"
}
