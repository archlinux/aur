# Maintainer: MuggleTwist <muggletwist@protonmail.com>
# Contributor: Mike Polvere <mic.tjs@gmail.com>

pkgname=mame-tools-bin
pkgver=0.228
pkgrel=1
pkgdesc="Tools for MAME / MESS: Castool, CHDman (Compressed Hunks of Data - CHD manager), floptool, jedutil, ldresample, romcmp ..."
arch=('x86_64')
	if [[ "$CARCH" == "x86_64" ]]; then
		_ARCH_="amd64"
	fi	
url="http://mamedev.org"
license=('custom:MAME')
depends=('flac>=1.3.0' 'libutf8proc>=1.3' 'sdl2>=2.0.8' 'zlib>=1.1.4')
conflicts=('mame')
source=("http://security.ubuntu.com/ubuntu/pool/universe/m/mame/mame-tools_${pkgver}+dfsg.1-${pkgrel}_${_ARCH_}.deb")
md5sums=('SKIP')


package() {
	# Extract package data
	tar xf data.tar.xz 
	cp -r usr "${pkgdir}"
	rm -rf "${pkgdir}/usr/share/doc/mame-tools/copyright"

	install -D -m644 "${srcdir}/usr/share/doc/mame-tools/copyright" "${pkgdir}/usr/share/licenses/mame-tools/LICENSE"
}
