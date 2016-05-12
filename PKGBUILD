# Maintainer: Patrick Griffis <tingping@tingping.se>

pkgname=tracer
pkgver=0.6.9
pkgrel=1
pkgdesc='Finds outdated running applications in your system'
_dirname="tracer-tracer-$pkgver-1"
arch=('any')
url='http://tracer-package.com/'
license=('GPL2')
depends=('python-beautifulsoup4' 'python-lxml' 'python-psutil' 'pyalpm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FrostyX/tracer/archive/tracer-$pkgver-1.tar.gz")
sha256sums=('c17d67a3f6fbbb71d5f9c126768bfbc35ff123ff4b5883194b6a90444911bedc')

build() {
    cd "$_dirname"

    python setup.py build
}

package() {
    cd "$_dirname"

    python setup.py install -O1 --skip-build --root="$pkgdir"
}

