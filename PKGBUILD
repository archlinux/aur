# Maintainer: Alan Berndt <alan@eatabrick.org>
pkgname=dcal
pkgver=1.2
pkgrel=1
pkgdesc="A generic calendar for X"
url="http://dcal.eatabrick.org"
license=('MIT')
arch=('i686' 'x86_64')
depends=('libx11')
provides=('dcal')
source=('https://github.com/bentglasstube/dcal/archive/v1.2.tar.gz')
sha1sums=('5684f67497c23202b45ca2826b10ec16276c0855')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
