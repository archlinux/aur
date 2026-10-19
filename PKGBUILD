# Maintainer: safalski
pkgname=ryuski-bin
_pkgname=ryuski
pkgver=0.0.3
pkgrel=1
pkgdesc="Local, trainable command assistant with a CLI and QML plugin (prebuilt binary)"
arch=('x86_64')
url="https://github.com/RyuZinOh/ryuSki"
license=('BSD-2-Clause')
depends=('sqlite' 'qt6-declarative')
optdepends=('kitty: default terminal for "go to <folder>" (override with $TERMINAL)')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!debug')
source=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.tar.gz")
sha256sums=('b3ede700bbf757ae6f875550f93982c989509cdcf4da086711df678bd3cfbf48')

package() {
  cp -a usr "$pkgdir/"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  mv "$pkgdir/usr/share/licenses/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rmdir "$pkgdir/usr/share/licenses/$_pkgname"
}
