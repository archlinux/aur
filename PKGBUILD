# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: dtw <dibble.at.thewrecker.dot.net>
# Contributor: Mathieu Gauthier <mathgl@freesurf.fr>
# Upgrade to ver. 1.8 - Pawel Bogur <jid:smeagol@uaznia.net>

pkgname=tcllib
pkgver=1.18
pkgrel=1
pkgdesc="Set of pure-Tcl extensions."
arch=('any')
url="http://core.tcl.tk/tcllib/"
license=('bsd')
depends=('tcl')
#source=(http://downloads.sourceforge.net/sourceforge/tcllib/tcllib-${pkgver}.tar.gz)
source=(https://github.com/tcltk/tcllib/archive/tcllib_${pkgver/./_}.tar.gz)
md5sums=('08dac86021c30c0a85c0a159f085143c')

package(){
  cd "$srcdir"/tcllib-tcllib_${pkgver/./_}
  tclsh installer.tcl -pkg-path "$pkgdir"/usr/lib/tcllib \
	-app-path "$pkgdir"/usr/bin \
	-nroff-path "$pkgdir"/usr/share/man/mann \
	-no-examples -no-html \
	-no-wait  -no-gui
  mkdir -p "$pkgdir"/usr/share/licenses/${pkgname}/
  cp license.terms "$pkgdir"/usr/share/licenses/${pkgname}/COPYING
  rm -f "$pkgdir"/usr/share/man/mann/{try,string,variable,zlib,coroutine}.n
}
