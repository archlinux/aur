# Maintainer: taskie <t at skie dot jp>

pkgname=xstow
pkgver=1.1.1
pkgrel=1
pkgdesc='A replacement of GNU Stow written in C++, supporting all features of Stow with some extensions'
arch=('x86_64')
url='https://github.com/majorkingleo/xstow'
license=('GPL-2.0-only')
depends=('glibc' 'libstdc++' 'libgcc' 'ncurses')
source=("https://github.com/majorkingleo/xstow/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8eef4d92d297c7c0b64d17bff46ee9ff8e413b4779b5600c97b94883c9c17f07')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-curses=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
