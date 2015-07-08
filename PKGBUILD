# Maintainer: Alan Berndt <alan@eatabrick.org>
pkgname=dcal
pkgver=1.1
pkgrel=1
pkgdesc="A generic calendar for X"
url="http://dcal.eatabrick.org"
license='MIT'
arch=('i686' 'x86_64')
depends=('libx11')
provides=('dcal')
source=('https://github.com/bentglasstube/dcal/archive/v1.1.tar.gz')
sha1sums=('2278bad1b01c9735c3bbfa5f2870ace6f0e9b447')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
