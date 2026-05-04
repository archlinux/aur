# Maintainer: Lotte V
# Contributor: Lotte V
pkgname=dataset-tools-bin
pkgver=0.0.8
pkgrel=1
pkgdesc="DiffSinger dataset processing tools, including audio processing, labeling."
arch=('x86_64')
url="https://github.com/openvpi/${pkgname%-bin}"
license=('Apache-2.0')
groups=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
options=('!debug')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
sha256sums=('11d55c167e840752f6d6ff03c08cbe0e3ed0cc4d52134bb91a7f076c2e1e11a1')
depends=(
    'qt6-base'
    'qt6-svg'
    'qt6-declarative'
    'libsndfile'
    'fftw'
    'onnxruntime'
)
source=(
    "${pkgname%-bin}-v${pkgver}.tar.xz::https://github.com/lottev1991/${pkgname%-bin}/releases/download/linux-v${pkgver}/$pkgname-v${pkgver}-aur.tar.xz"
)
package() {
	cd "$srcdir"

	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/usr/bin/config"
	install -dm755 "$pkgdir/usr/lib"
	install -dm755 "$pkgdir/usr/share/applications"

    install -dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cp -a "$srcdir/usr/bin/." "$pkgdir/usr/bin/"
    cp -a "$srcdir/usr/lib/." "$pkgdir/usr/lib/"
    cp -a "$srcdir/usr/share/applications/." "$pkgdir/usr/share/applications"
}
