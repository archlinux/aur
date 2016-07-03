pkgname=tclln
pkgver=1.0
pkgrel=4
pkgdesc="TclLN is a library for integrating a tcl-shell with custom commands"
url="https://github.com/TestudoAquatilis/tclln"
arch=('x86_64' 'i686' 'armv7h')
license=('LGPLv3')
depends=('tcl' 'glib2')
optdepends=()
makedepends=('git' 'gcc' 'make' 'sed')
conflicts=()
replaces=()
backup=()
#install='foo.install'
source=("git+https://github.com/TestudoAquatilis/tclln.git")
md5sums=('SKIP')

build () {
  cd "${pkgname}"
  make lib
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm744 libtclln.so "$pkgdir/usr/lib/libtclln.so"
  install -Dm644 tclln.pc "$pkgdir/usr/lib/pkgconfig/tclln.pc"
  install -Dm644 tclln.h "$pkgdir/usr/include/tclln.h"
}

# vim:set ts=2 sw=2 et:
