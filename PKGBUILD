# Maintainer:  Gabriel Souza Franco <Z2FicmllbGZyYW5jb3NvdXphQGdtYWlsLmNvbQ==>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: dtw <dibble.at.thewrecker.dot.net>
# Contributor: Mathieu Gauthier <mathgl@freesurf.fr>
# Contributor: Pawel Bogur <jid:smeagol@uaznia.net>

pkgname=tcllib
pkgver=1.18
pkgrel=2
pkgdesc="Set of pure-Tcl extensions."
arch=('any')
url="http://core.tcl.tk/tcllib/"
license=('bsd')
depends=('tcl')
source=(https://github.com/tcltk/tcllib/archive/tcllib_${pkgver/./_}.tar.gz)
sha256sums=('1c831474ed84fec349234a96bd7d855a74245bb305bfc2c9270bfde95c357b4f')

package(){
  cd "$srcdir"/tcllib-tcllib_${pkgver/./_}
  tclsh installer.tcl -pkg-path "$pkgdir"/usr/lib/tcllib \
	-app-path "$pkgdir"/usr/bin \
	-nroff-path "$pkgdir"/usr/share/man/mann \
	-no-examples -no-html \
	-no-wait  -no-gui
  install -Dm644 license.terms "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  rm -f "$pkgdir"/usr/share/man/mann/{try,string,variable,zlib,coroutine}.n
}
