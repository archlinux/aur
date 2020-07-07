# Maintainer: Antony Ho <ntonyworkshop@gmail.com>
pkgname=python-pycangjie
pkgver=1.3
pkgrel=1
pkgdesc="This is a Python wrapper to libcangjie, the library implementing Cangjie and Quick input methods."
arch=('x86_64' 'i686')
url="http://cangjians.github.io/projects/pycangjie/"
license=('LGPL3')
depends=('libcangjie' 'python>=3.2')
makedepends=('cython>=0.17' 'autoconf' 'automake')
replaces=('pycangjie-git')
sha256sums=('6cfc4ea568f0160fd63a6f786208b3cd991fc420aa61f7d03c41a1b903d39f7e')
source=("https://github.com/Cangjians/pycangjie/releases/download/v$pkgver/cangjie-$pkgver.tar.xz")


check() {
  cd "$srcdir/cangjie-$pkgver"
  make check
}

prepare() {
  cd "$srcdir/cangjie-$pkgver"
}

build() {
  cd "$srcdir/cangjie-$pkgver"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/cangjie-$pkgver"
  make DESTDIR="$pkgdir/" install
}
