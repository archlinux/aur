# Maintainer: Evilchuck666 <carlos.martinez.medina1992@gmail.com>
_pkgname=PyVideoKit
pkgname=pyvideokit
pkgver=0.1.0
pkgrel=1
pkgdesc="A collection of FFmpeg utility scripts"
arch=('any')
url="https://github.com/Evilchuck666/pyvideokit"
license=('GPLv3')
depends=('python' 'ffmpeg' 'sox')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/Evilchuck666/$_pkgname/archive/v$pkgver.tar.gz")
md5sums=('c144df4555504d19932c7d6d687138ce')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
