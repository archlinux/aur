# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Jose Riha <jose1711 gmail com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=bino
pkgver=1.6.8
pkgrel=1
pkgdesc='3D video player with multi-display support'
arch=('x86_64')
url='https://bino3d.org/'
license=('GPL3')
depends=('ffmpeg' 'freealut' 'freeglut' 'glewmx' 'libass' 'qt5-base')
optdepends=('lirc: infrared remote control')
source=(https://bino3d.org/releases/bino-${pkgver}.tar.xz{,.sig})
sha512sums=('d8cf5be356add4ed3fb36673038b5ffd92d0dc840798cc616fa4b11fec221c7f114347dfc7cdb7a3a24c5599b56301cddc99f84d3862d8e874612960281319cc'
	'SKIP')
validpgpkeys=('2F61B4828BBA779AECB3F32703A2A4AB1E32FD34')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure \
	  --prefix=/usr \
	  --with-qt-version=5 \
	  #--with-xnvctrl # Enable NVIDIA Quadro SDI output
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
