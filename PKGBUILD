# Maintainer: Eldred Habert <me@eldred.fr>
pkgname=pymusiclooper
pkgver=3.4.1
pkgrel=1
pkgdesc="A program for repeating music endlessly and creating seamless music loops, with play/export/tagging support"
arch=('any')
url="https://github.com/arkrow/PyMusicLooper"
license=('MIT')
groups=()
depends=('python>=3.9' 'python-librosa>=0.10.0' 'python-librosa<0.11' 'python-numpy>=1.25.0' 'python-numpy<2.0.0'
         'python-soundfile>=0.12.1' 'python-sounddevice>=0.4.6' 'yt-dlp>=2024.4.9'
         'python-rich-click>=1.8.0' 'python-rich-click<1.9' 'python-rich>=13.4.2' 'python-pytaglib>=3.0.0' 'python-pytaglib<4.0.0'
         'python-numba>=0.59.1' 'python-numba<0.60' 'python-click-params>=0.5.0' 'python-click-params<0.6'
         'python-click-option-group>=0.5.6' 'python-click-option-group<0.6' 'python-lazy-loader>=0.3')
makedepends=(python-build python-installer python-wheel 'python-poetry-core>=1.0.0' 'python-setuptools>=67.0.0')
optdepends=('ffmpeg: for supporting additional audio formats')
source=("pymusiclooper.tar.gz::https://github.com/arkrow/PyMusicLooper/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('370202ed977560e7c4929d7550e2851c2ba2f18354e6eec444e41cce22241cab')

build() {
	cd "PyMusicLooper-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "PyMusicLooper-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dvm 644 LICENSE "$pkgdir/usr/share/licenses/pymusiclooper/LICENSE"
}
