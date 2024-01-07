# Maintainer: Antonio Arias Orzanco <antonio dot arias99999 at gmail dot com>

_name=radio-active
pkgname=radioactive
pkgver=2.9.1
pkgrel=2
pkgdesc="Play and record any radio stations around the globe right from your terminal."
arch=('any')
url="https://github.com/deep5050/radio-active"
license=('MIT')
depends=('ffmpeg' 'python-colorlog' 'python-pick' 'python-psutil' 'python-pyradios=1.0.2' 'python-requests-cache' 'python-rich' 'python-zenlog')
#makedepends=('python-setuptools')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('mpv: mediaplayer to use' 'vlc: mediaplayer to use')
source=("$pkgname-$pkgver.tar.gz::https://github.com/deep5050/radio-active/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('816968f98b9ce5120838736703009f8b')

build() {
    cd "$_name-$pkgver"
    #python setup.py build
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    #python setup.py install --root="$pkgdir" --skip-build --optimize=1
    python -m installer --destdir="$pkgdir" dist/*.whl
}

