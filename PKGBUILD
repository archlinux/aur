# Maintainer: Antoine Lubineau <antoine@lubignon.info>
# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=gti
pkgver=1.6.1
pkgrel=1
pkgdesc="A silly git launcher"
arch=('i686' 'x86_64')
url="http://r-wos.org/hacks/gti"
license=('custom')
source=("https://github.com/rwos/gti/archive/v$pkgver.tar.gz"
        'LICENSE')
sha512sums=('a97693f43ea2b1c8b6312991ea2fd7c0eb4b9288da1992d187582f98429204c1bc81ce98a3029b30a7eecea78eb1ba6d2c3aa8497d1f104919cf7980d382c880'
            '1ffb66b89716dfcc5d093bc63a8744e8377d4acd97d8df90c486810535c108b18f6ca1a3dd4eb3cd9027e6330392871c702ca49a72afce5a7676380788c7440f')

build() {
  cd "$srcdir/gti-$pkgver"
  make
}

package() {
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "gti-$pkgver/gti" "$pkgdir/usr/bin/gti"
}

# vim:set ts=2 sw=2 et:
