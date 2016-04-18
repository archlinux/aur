# Contributor: epitron <chris at ill-logic dot com>
# Category: x11

pkgname=xse
pkgver=2.1
pkgrel=1
pkgdesc="A CLI for XSendEvent(3) (for sending keystrokes and mouse events to X11 windows)"
url='http://ftp.belnet.be/pub/ftp.x.org/R5contrib/'
license=("custom")
arch=('i686' 'x86_64')
depends=('libxaw')
makedepends=('imake')
source=('git+http://github.com/epitron/xse.git#tag=v2.1-patched')
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"

  xmkmf -a

  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR=${pkgdir} install
  make DESTDIR=${pkgdir} install.man
  install -Dm644 README ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
  make DESTDIR="${pkgdir}" install
}

