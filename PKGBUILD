# Maintainer: Adrien Smith <adrien@panissupraomnia.dev>
# Contributor: Gabriel Souza Franco <Z2FicmllbGZyYW5jb3NvdXphQGdtYWlsLmNvbQ==>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: dtw <dibble.at.thewrecker.dot.net>
# Contributor: Mathieu Gauthier <mathgl@freesurf.fr>
# Contributor: Pawel Bogur <jid:smeagol@uaznia.net>

pkgname=tcllib
pkgver=1.21
pkgrel=1
pkgdesc="Set of pure-Tcl extensions."
arch=('any')
url="http://core.tcl.tk/tcllib/"
license=('TCL')
depends=('bash' 'tcl')
source=("https://core.tcl-lang.org/tcllib/uv/tcllib-$pkgver.tar.gz")
sha256sums=('46b2bb5ec8049363ae01645af11bda3bdb5db10629e807d81d1ad46cd1bead50')

package(){
  cd "$srcdir"/tcllib-$pkgver
  ./installer.tcl \
    -pkg-path "$pkgdir"/usr/lib/tcllib \
	  -app-path "$pkgdir"/usr/bin \
	  -nroff-path "$pkgdir"/usr/share/man/mann \
	  -example-path "$pkgdir"/usr/share/doc/$pkgname \
    -no-html -no-wait  -no-gui
  install -Dm644 license.terms "$pkgdir"/usr/share/licenses/$pkgname/license.terms

  # To avoid conflict with blt
  mv "$pkgdir"/usr/share/man/mann/{,tcllib-}graph.n
}
