# Maintainer: MuggleTwist <muggletwist@protonmail.com>
# Contributor: Mike Polvere <mic.tjs@gmail.com>

pkgname=mame-tools
pkgver=0.221
pkgrel=1
pkgdesc="Tools for MAME / MESS: Castool, CHDman (Compressed Hunks of Data - CHD manager), floptool, jedutil, ldresample, romcmp ..."
arch=('i686' 'x86_64')
	if [[ "$CARCH" == "i686" ]]; then
		_ARCH_="i386"
	elif [[ "$CARCH" == "x86_64" ]]; then
		_ARCH_="amd64"
	fi	
url="http://mamedev.org"
license=('custom:MAME')
depends=('flac>=1.3.0' 'libutf8proc>=1.3' 'sdl2>=2.0.8' 'zlib>=1.1.4')
optdepends=('mame')
source=("http://security.ubuntu.com/ubuntu/pool/universe/m/mame/${pkgname}_${pkgver}+dfsg.1-${pkgrel}_${_ARCH_}.deb")
md5sums=('SKIP')


package() {
	# Extract package data
	tar xf data.tar.xz 
	cp -r usr "${pkgdir}"
	rm -rf "${pkgdir}/usr/share/doc/mame-tools/copyright"

	install -D -m644 "${srcdir}/usr/share/doc/mame-tools/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
