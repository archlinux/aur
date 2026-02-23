# Maintainer: coder0x6675

pkgname=crql-anina
pkgver=1.0.0
pkgrel=1
pkgdesc="Free VST3 and CLAP spectral resonance suppression by CRQL"
arch=("x86_64")
url="https://crql.works/anina"
license=("custom:proprietary")
groups=("pro-audio" "vst3-plugins" "clap-plugins")
source=("${pkgname}-${pkgver}.zip::https://api.crql.works/download/anina/linux/latest")
sha256sums=("e26ac77da4682868d48427c2bd27c303f54101be3edf49115e7c5af0f1c48360")
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

package() {
	install -d "$pkgdir/usr/lib/clap" "$pkgdir/usr/lib/vst3"
	install -m 0755 "$srcdir/CLAP/ANINA.clap" "$pkgdir/usr/lib/clap/"
	cp -r "$srcdir/VST3/ANINA.vst3" "$pkgdir/usr/lib/vst3/"
}

