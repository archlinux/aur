pkgname=aeolus-vst3-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Aeolus Organ Synth (VST3)"
url="https://github.com/Archie3d/aeolus_plugin"
license=('GPL')
arch=('x86_64')
groups=('pro-audio' 'vst3-plugins')
depends=('glibc')
makedepends=('unzip')
provides=("aeolus-vst3")
# do not provide vkd3d and lib32-vkd3d intentionally: providing them may break deepin-wine apps.
options=(!strip)
source=("https://github.com/Archie3d/aeolus_plugin/releases/download/v${pkgver}/Aeolus-standalone-vst3-linux-${pkgver}.zip")
sha256sums=('fd0f8c0a7a6112ac68412301979ad934cd97afa03adbaee29a39875097a3ad06')

package() {
	# Install VST3 Plugin
	install -Dm644 $srcdir/VST3/Aeolus.vst3/Contents/x86_64-linux/Aeolus.so $pkgdir/usr/lib/vst3/Aeolus.vst3/Contents/x86_64-linux/Aeolus.so
}
