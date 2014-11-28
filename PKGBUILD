# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=cappuccino
pkgver=0.5.1
pkgrel=2
pkgdesc="Run this software on your computer when you are not motivated to work, and enjoy doing something different"
arch=('i686' 'x86_64')
url="https://www.cgabriel.org/software/wiki/Cappuccino"
license=('GPL')
depends=('polygen' 'pygtk' 'python')
source=(http://www.sourcefiles.org/Toys/Miscellaenous/$pkgname-$pkgver.tar.gz)
md5sums=('e99094e278c2facc9d0f5f58086cd932')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  python setup.py install --root=${pkgdir} || return 1
  install -D -m644 $pkgname.1 ${pkgdir}/usr/share/man/man1/$pkgname.1 || return 1
}
