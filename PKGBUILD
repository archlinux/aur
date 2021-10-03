# Maintainer: Microeinstein <mu ddoott emc2 ddoott flower at inventati ddoott org>
# Contributor: Ivy Foster <iff@archlinux.org>

pkgname=inter-font-unhinted
pkgver=3.19
pkgrel=1
pkgdesc='A typeface specially designed for user interfaces (Desktop OTF version)'
url=https://github.com/rsms/inter/
license=(custom:OFL)
provides=('inter-font')
conflicts=('inter-font')
arch=(any)
source=("https://github.com/rsms/inter/releases/download/v$pkgver/Inter-$pkgver.zip")
# Warning: checksums provided by packager, not upstream
sha256sums=(150ab6230d1762a57bebf35dfc04d606ff91598a31d785f7f100356ecdcc0032)
noextract=("Inter-$pkgver.zip")

# Upstream dumps a *bunch* of stuff into the top level of the archive
prepare() {
	mkdir "inter-$pkgver"
	cd "inter-$pkgver"
	bsdtar xf ../Inter-$pkgver.zip
}

package() {
	cd "inter-$pkgver"
	install -d "$pkgdir/usr/share/fonts/inter"
	install -m644 -t "$pkgdir/usr/share/fonts/inter" 'Inter Desktop'/*.otf
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/inter-font/LICENSE.txt"
}
