# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=scarab-bin
pkgver=2.4.0.0
pkgrel=1
pkgdesc='Mod installer for Hollow Knight 1.5'
arch=(x86_64)
url="https://github.com/fifty-six/Scarab"
license=(GPL)
provides=(scarab)
conflicts=(scarab)
depends=(gcc-libs zlib fontconfig)
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/linux.zip")
sha256sums=('d28a6119a23063e44486d46052d1ce5b2e3e2edf79a6902fc33ef66107bb9564')
options=(!strip) # necessary for Scarab to run

package() {
	install -Dm755 -t "$pkgdir/opt/scarab/" *.so Scarab
	mkdir -p "$pkgdir/usr/bin/"
	ln -s "/opt/scarab/Scarab" "$pkgdir/usr/bin/Scarab"
}
