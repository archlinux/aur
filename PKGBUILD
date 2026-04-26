# Maintainerc: Harriet O'Brien <harrietobrien at protonmail dot me>
# Contributor: Mike Sampson <mike at sambodata dot com>
# Contributor: Andrea Benazzo <andy@qitty.net>
pkgname=cryptmount
pkgver=6.4.0
_pkgver=6.4
pkgrel=1
pkgdesc="Utility allowing an ordinary user to mount an encrypted file system"
arch=('i686' 'x86_64')
url="https://github.com/rwpenney/cryptmount"
license=('GPL')
depends=(libgcrypt device-mapper util-linux autoconf)
source=(https://github.com/rwpenney/cryptmount/archive/refs/tags/v$pkgver.tar.gz)
backup=('etc/cryptmount/cmtab')
sha512sums=('b84cb0571533d230686626594b5c213dab5d009a29a643b74e6747368cf140dd39e1fbfffdb5ca757edc026a5e02a9aa6ff61a8fe9a3969a153448b73c3b929f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf -v -i
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
