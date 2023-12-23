# Maintainer: Eldred Habert <me@eldred.fr>
pkgname=pymusiclooper
pkgver=3.2.2
pkgrel=1
pkgdesc="A program for repeating music endlessly and creating seamless music loops, with play/export/tagging support"
arch=('any')
url="https://github.com/arkrow/PyMusicLooper"
license=('MIT')
groups=()
depends=('python>=3.8' 'python-librosa>=0.10.0' 'python-librosa<0.11' 'python-numpy>=1.24.0'
         'python-soundfile>=0.12.1' 'python-sounddevice>=0.4.6' 'yt-dlp'
         'python-rich-click>=1.6.1' 'python-rich-click<1.7' 'python-rich>=13.4.2' 'python-pytaglib>=2.0.0'
         'python-numba>=0.57.0' 'python-numba<0.59' 'python-click-params>=0.4.1' 'python-click-params<0.5'
         'python-click-option-group>=0.5.6' 'python-click-option-group<0.6' 'python-lazy-loader>=0.3')
makedepends=(python-build python-installer python-wheel 'python-poetry-core>=1.0.0' 'python-setuptools>=67.0.0')
optdepends=('ffmpeg: for supporting additional audio formats')
source=("pymusiclooper.tar.gz::https://github.com/arkrow/PyMusicLooper/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('adfeb3276a9e04179b1516b07da8ef84a3185db393dd3fdd4d0cfb41361cc8bb')

build() {
	cd "PyMusicLooper-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "PyMusicLooper-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dvm 644 LICENSE "$pkgdir/usr/share/licenses/pymusiclooper/LICENSE"
}
