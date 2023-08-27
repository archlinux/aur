# Maintainer: Pavel Sibal <entexsoft@gmail.com>
pkgname=musescore4-no-sound-patch
pkgver=0.1
pkgrel=1
pkgdesc="MuseScore4 patch solving the no sound problem due missing soundfont files."
arch=('any')
url="https://gitlab.com/linux-stuffs/musescore4-no-sound-patch"
license=('GPL3')
groups=('pro-audio')

provides=("${pkgname}")
conflicts=("${pkgname}")
depends=('bash' 'musescore=4.1.1-1')
options=('!strip')

source=('https://gitlab.com/linux-stuffs/musescore4-no-sound-patch/-/raw/main/distrib/musescore4-no-sound-patch-0.1-0.tar.gz')
sha256sums=('SKIP')

package() {
	cd "${srcdir}/${pkgname}"
	./configure  --prefix=/usr
	make install DESTDIR="${pkgdir}"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	cp --no-preserve=ownership "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
