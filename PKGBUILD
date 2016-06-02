# Maintainer: Daniel Landau <daniel@landau.fi>
_pkgname=vnc_reflector
pkgname=vncreflector
pkgver=1.2.4
pkgrel=1
pkgdesc="VNC server acting as a proxy"
arch=('i686' 'x86_64')
url="http://vnc-reflector.sourceforge.net/"
license=('BSD')
depends=(libjpeg-turbo zlib)
source=("http://downloads.sourceforge.net/project/vnc-reflector/vnc-reflector/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('c3f88bc62f228b335c25c07f9744ab0c')

build() {
	cd "${_pkgname}"
	make
}

package() {
	cd "${_pkgname}"
	install -D vncreflector "$pkgdir/usr/bin/vncreflector"
  install -D README "$pkgdir/usr/share/doc/vncreflector/README"
  install -D LICENSE "$pkgdir/usr/share/licenses/vncreflector/LICENSE"
}
