# Maintainer: Juliette Monsel <j_4321@protonmail.com>
pkgname=tktray
pkgver=1.3.9
pkgrel=2
pkgdesc="Tk extension to create system tray icons following www.freedesktop.org specifications."
arch=('i686' 'x86_64')
url="http://www.sw4me.com/wiki/Tktray"
license=('MIT')
depends=('tk' 'tcl')
source=("$pkgname$pkgver.tar.gz::https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/tktray/$pkgname$pkgver.tar.gz")
sha512sums=('2c52a343e7f8ff5b7e7bb2e2f1de7766111ce6b47b8ace478a1f2aaa6c28a5b19ec854f2b22511136be1f1da2a87f506932a1d1b893deb3c44a7e47a28609518')

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
