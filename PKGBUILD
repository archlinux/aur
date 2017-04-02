# Maintainer: NexAdn
pkgname=obs-linuxbrowser
pkgver=0.1.1
pkgrel=1
pkgdesc="Browser source plugin for obs-studio based on CEF. Alternative to obs-qtwebkit."
arch=("x86_64")
url="https://github.com/bazukas/obs-linuxbrowser"
license=("GPL")
depends=("obs-studio>=18.0.1" "libxrandr")
makedepends=("wget" "git")
source=(
    "https://github.com/bazukas/obs-linuxbrowser/releases/download/${pkgver}/linuxbrowser${pkgver}-obs18.0.1-64bit.tgz"
)
sha256sums=(
    "b239af42564275c8cf0e35213de6a4ce76f392d213f9e059b268794dacfb166d"
)
package() {
	mkdir -p $pkgdir/$HOME/.config/obs-studio/plugins/obs-linuxbrowser
	cp -R $srcdir/$pkgname/* $pkgdir/$HOME/.config/obs-studio/plugins/obs-linuxbrowser
	chmod -R 0750 $pkgdir/$HOME/.config/
	chmod -R 0755 $pkgdir/$HOME/.config/obs-studio
}
