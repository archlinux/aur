# Maintainer: Alexey Rochev <equeim@gmail.com>

pkgname='xfce4-alsa-plugin'
pkgver=0.1.1
pkgrel=1
pkgdesc='Simple ALSA volume control for xfce4-panel'
url='https://github.com/equeim/xfce4-alsa-plugin'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('alsa-lib' 'gtk2' 'xfce4-panel')
makedepends=('vala' 'python' 'intltool')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('38a6b5aeb1664a0bb7ee49cc8b77070f0219362784281b6b55ec8afdb88a2956')

build() {
	cd "${pkgname}-${pkgver}"
	./waf configure build --prefix=/usr --libdir=/usr/lib
}

package() {
	cd "${pkgname}-${pkgver}"
	./waf install --destdir="${pkgdir}"
}
