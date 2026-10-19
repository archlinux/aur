# Maintainer: safalski
pkgname=ryuski-bin
_pkgname=ryuski
pkgver=0.0.1
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
sha256sums=('c69fe12e1b2ec5856e0f2aa8e510d67c55add6775821226b9c9076ca7bdfc1fb')

package() {
  cp -a usr "$pkgdir/"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  mv "$pkgdir/usr/share/licenses/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rmdir "$pkgdir/usr/share/licenses/$_pkgname"
}
