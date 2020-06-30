# Contributor: Jan Misiak <fijam@archlinux.ux>

pkgname=ttf-exljbris
pkgver=1.1
pkgrel=7
pkgdesc='A collection of free opentype fonts by Jos Buivenga. Includes Delicious, Diavlo, Fontin, Fontin Sans and Tallys'
arch=('i686' 'x86_64')
license=('custom')
url='http://www.exljbris.com/'
depends=('fontconfig' 'xorg-fonts-encodings')
source=('http://www.exljbris.com/dl/delicious-123.zip'
	'http://www.exljbris.com/dl/Diavlo_II_37b2.zip'
	'http://www.exljbris.com/dl/fontin_pc.zip'
	'http://www.exljbris.com/dl/FontinSans_49.zip'
	'http://www.exljbris.com/dl/tallys_15b2.zip'
	'exljbris-font-licence.txt')
sha256sums=('e9d5ce8e7c8dbf521727bddfbbe1e947fb28f5a0143ee7f5287f45e5beb70ed2'
	'863acd293fb186eebdbf77cba2739f26626874c848bedb9b7577e07e5996a3d3'
	'ddbb4ba57d0ab7d1af9d511de8e68d0fab9beec0c03eaf9c968f180b96100aa7'
	'8b04ea509ec5fa8ddf921c94ba1824130071d16b7f83b09bc257b9311ff65a6e'
	'c0b951253e07557590b3dc2c7ffea19d553b3f5bf34d45f80b4114d90e527bad'
	'ea29b01be55f6498af65c3553fb84d67babd881ac382697ba4d6a2e7ff1af5b0')

prepare() {
	# remove hidden file
	find -type f -name ".*" -delete
}

package() {
	mkdir -p ${pkgdir}/usr/share/fonts/OTF

	install -m0644 -D $(find -type f -name "*.otf") ${pkgdir}/usr/share/fonts/OTF
	install -m0644 -D exljbris-font-licence.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

