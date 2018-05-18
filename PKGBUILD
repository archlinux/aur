# Maintainer: Bandie <bandie@chaospott.de>
# Contributor: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>
pkgname=icat
pkgver=0.5
pkgrel=1
pkgdesc="outputs images in 256-color capable terminals"
arch=('i686' 'x86_64')
url="https://github.com/atextor/icat"
license=('BSD')
depends=('imlib2')
conflicts=('icat-git')
source=(https://github.com/atextor/icat/archive/v${pkgver}.tar.gz)
sha512sums=('c937adf3f2c4d71d7928a48b286d44828b47d72c1b16114cc99353a8dabb2a43513931f7f3e8139acdccf0dd4598800ec01feca864b7a0fe788f563bedb6ee28')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 icat $pkgdir/usr/bin/icat
}
