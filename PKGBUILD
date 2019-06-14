# Maintainer:  Gabriel Souza Franco <Z2FicmllbGZyYW5jb3NvdXphQGdtYWlsLmNvbQ==>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: dtw <dibble.at.thewrecker.dot.net>
# Contributor: Mathieu Gauthier <mathgl@freesurf.fr>
# Contributor: Pawel Bogur <jid:smeagol@uaznia.net>

pkgname=tcllib
pkgver=1.19
pkgrel=2
pkgdesc="Set of pure-Tcl extensions."
arch=('any')
url="http://core.tcl.tk/tcllib/"
license=('bsd')
depends=('tcl')
source=("https://core.tcl-lang.org/tcllib/uv/tcllib-${pkgver/./-}.tar.gz")
sha256sums=('f0977ed98a6555266461a818d2814ff11f35f90412d394e13bf3da686cc93ca0')

package(){
  cd "$srcdir"/tcllib-tcllib-${pkgver/./-}
  tclsh installer.tcl -pkg-path "$pkgdir"/usr/lib/tcllib \
	-app-path "$pkgdir"/usr/bin \
	-nroff-path "$pkgdir"/usr/share/man/mann \
	-no-examples -no-html \
	-no-wait  -no-gui
  install -Dm644 license.terms "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  for manp in graph; do
    mv "$pkgdir"/usr/share/man/mann/{,tcllib-}$manp.n
  done
}
