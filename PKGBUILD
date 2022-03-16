# Maintainer: Antonio Vázquez Blanco <antoniovazquezblanco@gmail.com>
# Maintainer: crave <crave@invalid>
pkgname=graudit
pkgrel=1
pkgver=3.4
pkgdesc="Grep rough source code auditing tool."
arch=(any)
url="https://github.com/wireghoul/$pkgname"
license=('GPL')
provides=("$pkgname")
conflicts=("$pkgname-git")

source=("https://codeload.github.com/wireghoul/${pkgname}/tar.gz/refs/tags/v$pkgver")
sha512sums=('631f6753d3d30f6b0f457791bf953f080f642c181c3bd9d1d3b04ee34c54bee1a42a155a60462b1dfb11d3b3305cb507772627b0b8cb348c7a1453f2add8dd50')

build() {
  tar xvf "v$pkgver"
  cd -- "$srcdir/$pkgname-$pkgver"
  patch Makefile ../../Makefile.patch
}

package() {
  cd -- "$srcdir/$pkgname-$pkgver"
  prefix="$pkgdir/usr" make install
}
