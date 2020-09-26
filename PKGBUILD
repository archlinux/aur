# Contributor: Pascal Ernster <aur at hardfalcon dot net>
# Contributor: Alexandros Theodotou <alex at zrythm dot org>

pkgname="libcyaml"
pkgver=1.1.0
pkgrel=1
pkgdesc="C library for reading and writing YAML"
arch=('x86_64')
url="https://github.com/tlsa/libcyaml"
license=('ISC')
depends=('libyaml')
source=("https://github.com/tlsa/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('01a328063d4bd22bf722498061af7c1b55de995bb0b84c2249b34b5708e65657767edf8f0de9a7400d09b98e5ad71f369c0cd6293710b5c9d0578276e4703643')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" PREFIX="/usr" install
	install --target-directory="${pkgdir}/usr/share/licenses/${pkgname}" -D "LICENSE"
}
