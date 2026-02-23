# Maintainer: coder0x6675

pkgname=crql-locd
pkgver=1.0.6
pkgrel=1
pkgdesc="Phase-Locked distortion for MEGA crunchiness by CRQL"
arch=("x86_64")
url="https://crql.works/locd"
license=("custom:proprietary")
groups=("pro-audio" "vst3-plugins" "clap-plugins")
source=("${pkgname}-${pkgver}.zip::https://api.crql.works/download/locd/linux/latest")
sha256sums=("9cee0b4594e077d804a2b76cc23788dc2e2ed8b7efff19780a96aad3e8a7fcc6")
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

package() {
	install -d "$pkgdir/usr/lib/clap" "$pkgdir/usr/lib/vst3"
	install -m 0755 "$srcdir/CLAP/LOCD.clap" "$pkgdir/usr/lib/clap/"
	cp -r "$srcdir/VST3/LOCD.vst3" "$pkgdir/usr/lib/vst3/"
}

