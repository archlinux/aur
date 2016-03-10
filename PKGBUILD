# Maintainer: Patrick Griffis <tingping@tingping.se>

pkgname=tracer
pkgver=0.6.8
pkgrel=1
pkgdesc='Finds outdated running applications in your system'
_dirname="tracer-tracer-$pkgver-1"
arch=('any')
url='http://tracer-package.com/'
license=('GPL2')
depends=('python-beautifulsoup4' 'python-lxml' 'python-psutil')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FrostyX/tracer/archive/tracer-$pkgver-1.tar.gz")
sha256sums=('efe786b4b7780b66c7df97c87c7539b8c9de506b499490fc7d600002dda6885c')

build() {
    cd "$_dirname"

    python setup.py build
}

package() {
    cd "$_dirname"

    python setup.py install -O1 --skip-build --root="$pkgdir"
}

