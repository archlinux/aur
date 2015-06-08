# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Gullible Jones <dlev89@gmail.com>

pkgname=xine-plugin
pkgver=1.0.2
pkgrel=2
pkgdesc="A xine-based multimedia player plugin for Mozilla browsers and other plugin-compatible browsers."
url="http://www.xine-project.org/"
arch=("i686" "x86_64")
license=("GPL")
depends=("xine-lib")
source=(http://downloads.sourceforge.net/xine/${pkgname}-${pkgver}.tar.bz2)

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure --prefix=/usr --with-plugindir=/usr/lib/mozilla/plugins
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
}

sha1sums=('57a9f6368a72c3f08623cff11876a1d0e8f611c0')
