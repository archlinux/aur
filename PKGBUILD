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
sha256sums=('bfc79a16387b091b031626e7f7ee8fb19ed9da855935cf3b2d0becdd53fc9242')
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

    cp -a "$srcdir/usr/bin/." "$pkgdir/usr/bin/"
    cp -a "$srcdir/usr/lib/." "$pkgdir/usr/lib/"
    cp -a "$srcdir/usr/share/applications/." "$pkgdir/usr/share/applications"
    cp -a "$srcdir/usr/share/licenses/dataset-tools/LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
