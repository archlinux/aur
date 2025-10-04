# Based on zinkrun PKGBUILDs written
# by Jorge Pizarro-Callejas, a.k.a Jorgicio <jpizarrocallejas@gmail.com>
# Maintainer: kharovtobi <tugboat_khatov at outlook dot com>

pkgname=mesarun
pkgver=1.0
pkgrel=1
pkgdesc="Wrapper for software rasterizers and Zink to use in OpenGL games on top of your CPU or Vulkan."
arch=('any')
url="https://github.com/kharovtobi/mesarun"
license=('GPL2')
depends=('bash' 'mesa' 'opengl-driver' 'vulkan-icd-loader')
optdepends=(
	'vulkan-swrast: Software rendering for Vulkan')
conflicts=('zinkrun')
install=mesarun.install
source=("https://github.com/kharovtobi/mesarun/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d6537c77e9d8371a387401c1072a53cfd4b478dec8a2db3f8026163e0b1c114c')

package() {
	cd mesarun-$pkgver
	install -Dm755 "src/usr/bin/llvmpiperun" "$pkgdir/usr/bin/llvmpiperun"
	install -Dm755 "src/usr/bin/softpiperun" "$pkgdir/usr/bin/softpiperun"
	install -Dm755 "src/usr/bin/swrastrun" "$pkgdir/usr/bin/swrastrun"
	install -Dm755 "src/usr/bin/zinkrun" "$pkgdir/usr/bin/zinkrun"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
