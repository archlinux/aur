# Maintainer: coder0x6675

pkgname=crql-anina
pkgver=1.1.1
pkgrel=1
pkgdesc='Free VST3 and CLAP spectral resonance suppression by CRQL'
arch=('x86_64')
url='https://crql.works/anina'
license=('custom:proprietary')
groups=('pro-audio' 'vst3-plugins' 'clap-plugins')
source=("${pkgname}-${pkgver}.zip::https://api.crql.works/download/anina/linux/${pkgver}")
sha256sums=('9342b7115cc59a05c5a8de64467171f4241e37b5c4abc54502a79d3c96645d67')
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
depends=(
	'alsa-lib'
	'fontconfig'
	'freetype2'
	'gcc-libs'
	'glibc'
)

package() {
	install -d "$pkgdir/usr/lib/clap" "$pkgdir/usr/lib/vst3"
	install -m 0755 "$srcdir/CLAP/ANINA.clap" "$pkgdir/usr/lib/clap/"
	cp -r "$srcdir/VST3/ANINA.vst3" "$pkgdir/usr/lib/vst3/"
}

