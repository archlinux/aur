# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=gti
pkgver=1.0.4
pkgrel=1
pkgdesc="A silly git launcher"
arch=('i686' 'x86_64')
url="http://r-wos.org/hacks/gti"
license=('custom')
source=("https://github.com/rwos/gti/tarball/v$pkgver"
        'LICENSE')
sha256sums=('72fdc62d1977052567944d709e31ac41bfdf7a179a3ac6a71a8e1c67ff2102ed'
            '131817f9197405ccbfed83ad13d85f8cebccfe53be11151625bdec3c9c014d0b')

build() {
  cd "$srcdir/rwos-gti-e16ca0b"
  make
}

package() {
  cd "$srcdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd rwos-gti-e16ca0b
  install -Dm755 gti "$pkgdir/usr/bin/gti"
}

# vim:set ts=2 sw=2 et:
