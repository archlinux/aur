# Maintainer: NexAdn
pkgname=obs-linuxbrowser
pkgver=0.1.1
pkgrel=2
pkgdesc="Browser source plugin for obs-studio based on CEF. Alternative to obs-qtwebkit."
arch=("x86_64")
url="https://github.com/bazukas/obs-linuxbrowser"
license=("GPL")
depends=(
	"obs-studio>=18.0.1" "libxrandr" 
	"atk" "libxcomposite" "pango" "gconf" "libxss" "nss"
)
makedepends=("wget" "git")
source=(
    "https://github.com/bazukas/obs-linuxbrowser/releases/download/${pkgver}/linuxbrowser${pkgver}-obs18.0.1-64bit.tgz"
)
sha256sums=(
    "97dfc8b70451f34064f569d9cf325d494e73c454d7b9c8c1f661464507ed5a10"
)
package() {
	mkdir -p $pkgdir/$HOME/.config/obs-studio/plugins/obs-linuxbrowser
	cp -R $srcdir/$pkgname/* $pkgdir/$HOME/.config/obs-studio/plugins/obs-linuxbrowser
	chmod -R 0750 $pkgdir/$HOME/.config/
	chmod -R 0755 $pkgdir/$HOME/.config/obs-studio
}
