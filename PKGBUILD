# Maintainer: David Phillips <dbphillipsnz gmail>

pkgname=farbfeld
pkgver=2
pkgrel=1
pkgdesc="conversion tools for the suckless image format"
url="http://tools.suckless.org/farbfeld/"
arch=('i686' 'x86_64')
license=('ISC')
depends=('libjpeg-turbo' 'libpng')
makedepends=()
provides=()
conflicts=(${pkgname}-git)
source=(http://git.suckless.org/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.bz2)
sha512sums=('a76dc5730ec108c711e0f45955e3db183a0da8c1a3c1a53396a9e5fea91292e4f78dd3681f96cc0110025fc24320a564f3d52aef68abbb29fec691d57023564c')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR=${pkgdir} install
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

