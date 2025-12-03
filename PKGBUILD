# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=scarab-bin
pkgver=2.7.0.0
pkgrel=1
pkgdesc='Mod installer for Hollow Knight 1.5'
arch=(x86_64)
url="https://github.com/fifty-six/Scarab"
license=(GPL-3.0-only)
provides=(scarab)
conflicts=(scarab)
depends=(glibc gcc-libs zlib fontconfig)
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/linux.zip")
sha256sums=('7a4824ebb00c3c391645aae760519294933cc3e67d89e0efac6d63fa78f71891')
options=(!strip) # necessary for Scarab to run

package() {
	install -Dm755 -t "$pkgdir/opt/scarab/" *.so Scarab
	mkdir -p "$pkgdir/usr/bin/"
	ln -s "/opt/scarab/Scarab" "$pkgdir/usr/bin/Scarab"
}
