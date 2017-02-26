# Maintainer: katoh <katoh_at_mikage.ne.jp>

pkgname=azpainter
pkgver=2.0.2
pkgrel=1
pkgdesc="Painting software"
arch=('i686' 'x86_64')
url="http://azsky2.html.xdomain.jp/"
license=('GPL3')
depends=('fontconfig' 'freetype2' 'libjpeg-turbo' 'libx11' 'libxext' 'libxi' 'zlib' 'hicolor-icon-theme')
source=("https://osdn.net/frs/redir.php?m=jaist&f=%2Fazpainter%2F67130%2Fazpainter-2.0.2.tar.bz2")
sha256sums=("24ee7cb15bb313a395d35094fe41cd9fc21bad67d2fffbbf7cce41d8c6b5a589")

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix /usr
	make -j1
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
}
