# Maintainerc: Harriet O'Brien <harrietobrien at protonmail dot me>
# Contributor: Mike Sampson <mike at sambodata dot com>
# Contributor: Andrea Benazzo <andy@qitty.net>
pkgname=cryptmount
pkgver=6.3.0
_pkgver=6.3
pkgrel=1
pkgdesc="Utility allowing an ordinary user to mount an encrypted file system"
arch=('i686' 'x86_64')
url="https://github.com/rwpenney/cryptmount"
license=('GPL')
depends=(libgcrypt device-mapper util-linux autoconf)
source=(https://github.com/rwpenney/cryptmount/archive/refs/tags/v$pkgver.tar.gz)
backup=('etc/cryptmount/cmtab')
sha512sums=('15f19a1ff7409b35be2cde3d791c8d476c98ffcaf3dd9217076703b0e0baafe999a0608a88cc51039ba2e9c26cb297261128a5efeacd1a6397c5d3300886ac4d')

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
