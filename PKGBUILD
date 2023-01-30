# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=scarab-bin
pkgver=1.20.0.0
pkgrel=1
pkgdesc='Mod installer for Hollow Knight 1.5'
arch=(x86_64)
url="https://github.com/fifty-six/Scarab"
license=(GPL)
provides=(scarab)
conflicts=(scarab)
depends=(gcc-libs zlib fontconfig)
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/linux.zip")
sha256sums=('247e6f180c2b01be14ad27152729bcbbdf3a40d154d424585a0c790a81a0f2f8')
options=(!strip) # necessary for Scarab to run

package() {
	install -Dm755 -t "$pkgdir/opt/scarab/" *.so Scarab
	mkdir -p "$pkgdir/usr/bin/"
	ln -s "/opt/scarab/Scarab" "$pkgdir/usr/bin/Scarab"
}
