# Contrubtor: kusakata <shohei atmark kusakata period com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=pmw
pkgver=4.28
pkgrel=1
pkgdesc='A computer program for high quality music typesetting.'
arch=('i686' 'x86_64')
depends=('ghostscript')
url="http://www.quercite.com/pmw.html"
license=('GPL')
source=("http://www.quercite.com/${pkgname}-${pkgver}.tar.gz")
md5sums=('7112d2cbb9cb3d71b012879f87ab17e6')
sha1sums=('30647997034017a679b743d2f7bf41f3f9686f64')
sha256sums=('ecbd2cdeb38fb82c2a482e22119b27cc6959e26b6ae6d318ba366471781dfe13')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" MANDIR="$pkgdir/usr/share/man" install
}

