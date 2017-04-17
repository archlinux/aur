# Maintainer: NexAdn
pkgname=obs-linuxbrowser
pkgver=0.1.2
pkgrel=1
pkgdesc="Browser source plugin for obs-studio based on CEF. Alternative to obs-qtwebkit."
arch=("x86_64")
url="https://github.com/bazukas/obs-linuxbrowser"
license=("GPL")
depends=(
	"obs-studio>=18.0.1" "libxrandr" 
	"atk" "libxcomposite" "pango" "gconf" "libxss" "nss"
)
makedepends=()
source=(
    "https://github.com/bazukas/obs-linuxbrowser/releases/download/${pkgver}/linuxbrowser${pkgver}-obs18.0.1-64bit.tgz"
)
sha256sums=(
    "5f232e5fef48d426a2a3444f7b7a993e578c7d29604c6fd640016839054a5f5d"
)
package() {
	mkdir -p $pkgdir/usr/lib/obs-plugins/
	mkdir -p $pkgdir/usr/share/obs/obs-plugins/$pkgname
	cp -R $srcdir/$pkgname/bin/64bit/* $pkgdir/usr/lib/obs-plugins/
	mv $pkgdir/usr/lib/obs-plugins/libobs-linuxbrowser.so $pkgdir/usr/lib/obs-plugins/obs-linuxbrowser.so
	cp -R $srcdir/$pkgname/data/* $pkgdir/usr/share/obs/obs-plugins/$pkgname
}
