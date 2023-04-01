# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Jason Chu <jason@archlinux.org>

pkgname=xdiskusage
pkgver=1.60
pkgrel=2
pkgdesc="A user-friendly program to show you what is using up all your disk space"
arch=('x86_64')
depends=('fltk')
makedepends=('libxi')
license=('GPL')
url="https://xdiskusage.sourceforge.net"
options=(!emptydirs)
source=("https://xdiskusage.sourceforge.net/$pkgname-$pkgver.tgz")
sha256sums=('7b536dc6f1bdc6d9bec7c29b9435c23d9d32bff8a0ebee26b9966b273dc9f67e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man1"
  make prefix="$pkgdir/usr" mandir="$pkgdir/usr/share/man" install
  chmod 0644 "$pkgdir"/usr/share/man/man1/*
}
