# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>
# Maintainer: Kevin Brubeck Unhammer <unhammer@gmail.com>
pkgname=apertium-nn-nb
pkgver=0.7.0
pkgrel=2
pkgdesc="Apertium language data for the Norwegian Nynorsk-Norwegian Bokmål translator."
url="http://wiki.apertium.org/wiki/Norwegian_Nynorsk_and_Norwegian_Bokmål"
license=('GPL')
makedepends=('pkgconfig')
depends=('lttoolbox>=3.2.0' 'apertium>=3.2.0' 'vislcg3>=0.9.7.6010')
# TODO: This package must be recompiled for _every_ new vislcg3 release (that's just the vislcg3 policy)
optdepends=('lttoolbox-java: for compound analysis (use mode nb-nn-cp or nb-nn_a-cp)')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/sourceforge/apertium/${pkgname}-${pkgver}.tar.gz")
md5sums=('708ece31d9017963f2adac14a30fdf62')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}