# Maintainer: Martin C. Doege <mdoege at compuserve dot com>

pkgname=starplot
pkgver=0.95.5
pkgrel=3
pkgdesc="A 3-dimensional star chart viewer."
arch=('i686' 'x86_64')
url="http://starplot.org/"
license=('GPL')
depends=(gtk2)
optdepends=('starplot-yale5: star catalog'
            'starplot-gliese3: star catalog')
source=(http://starplot.org/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('ff51981f48240b234f24448510ed089c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
