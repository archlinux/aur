# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="espeak-phonemizer"
pkgver=1.0.0
pkgrel=1
pkgdesc="Uses ctypes and libespeak-ng to transform test into IPA phonemes "
url="https://github.com/rhasspy/espeak-phonemizer"
license=("GPL3")
arch=("any")
depends=("python" "espeak-ng")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("https://github.com/rhasspy/espeak-phonemizer/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f3b5474fe2d1ae6512ede2d4af93e5f73c3d7aebee77f583f1a07fdbd9d05b35')
options=("!strip")

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
