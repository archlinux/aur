# Maintainer: Hayate Nakamura <hayatehay.njb at gmail dot com>

pkgname=kasumi-unicode
pkgver=2.6
pkgrel=1
pkgdesc='Dictionary management tool for anthy-unicode'
arch=('x86_64')
url='https://github.com/fujiwarat/kasumi-unicode'
license=('LGPL' 'GPL')
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('fa97e3ca6199b2736135741ef7f627c999c5da86d2cb5b3698b1f29508867fb7511e1e54465387ca47755f97275c0535c1f5decf8fbe5446a4de527637464269')
depends=('anthy-unicode' 'gtk3')
makedepends=('gcc12')
conflicts=('kasumi')

build() {
	export CXXFLAGS='-std=c++11'
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
