# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=gti
pkgver=1.2.0
pkgrel=1
pkgdesc="A silly git launcher"
arch=('i686' 'x86_64')
url="http://r-wos.org/hacks/gti"
license=('custom')
source=("https://github.com/rwos/gti/tarball/v$pkgver"
        'LICENSE')
sha256sums=('08dbf3156e203141f626ccd8fc97b289e9bd92ced6906a18bdc8a288f1fa4df6'
            '131817f9197405ccbfed83ad13d85f8cebccfe53be11151625bdec3c9c014d0b')

build() {
  cd "$srcdir/rwos-gti-97639f3"
  make
}

package() {
  cd "$srcdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd rwos-gti-97639f3
  install -Dm755 gti "$pkgdir/usr/bin/gti"
}

# vim:set ts=2 sw=2 et:
