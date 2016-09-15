# Maintainer: Juliette Monsel <j_4321@sfr.fr>
pkgname=tktray
pkgver=1.3.9
pkgrel=1
pkgdesc="Tk extension to create system tray icons following www.freedesktop.org specifications."
arch=('i686' 'x86_64')
url="http://www.sw4me.com/wiki/Tktray"
license=('MIT')
depends=('tk' 'tcl')
source=("$pkgname$pkgver.tar.gz::https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/tktray/$pkgname$pkgver.tar.gz")
md5sums=('6f7f22e7c6f1d7dc9f7e19ee2e9a82aa')

build() {
  cd $srcdir/$pkgname$pkgver
  ./configure --prefix=/usr --with-tcl=/usr/lib --with-tk=/usr/lib
  make
}

package() {
  cd $srcdir/$pkgname$pkgver
  make DESTDIR="${pkgdir}" install
  install -D -m644 license.terms "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
