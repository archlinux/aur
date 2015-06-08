# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
# $Id: PKGBUILD 78535 2012-10-20 10:30:17Z ebelanger $
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Ryan Corder <ryanc@greengrey.org>
pkgname=pam-krb5
pkgver=4.7
pkgrel=1
pkgdesc="PAM module providing Kerberos v5 support"
arch=(i686 x86_64 armv6h)
url="http://www.eyrie.org/~eagle/software/pam-krb5/"
license=(custom)
depends=(krb5 pam)
source=("http://archives.eyrie.org/software/kerberos/$pkgname-$pkgver.tar.gz"
        "http://archives.eyrie.org/software/kerberos/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('9b4ff52d0456939a0fe6d6676a965a6c2351d9f2c011de8402bfc12c547a7412'
            'SKIP')
validpgpkeys=('E784364E8DDE7BB370FBD9EAD15D313882004173')

build() {
  cd "$pkgname-$pkgver"
  ./configure \
    --prefix=/usr             \
    --enable-reduced-depends  \
    --libdir=/usr/lib         ;
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ft=sh:ts=2:sw=2:et
