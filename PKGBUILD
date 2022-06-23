# Maintainer: Arthurdw <contact@arthurdw.com>
_name=statusof
pkgname=python-${_name}
pkgver=0.2.2
pkgrel=2
pkgdesc="Small Python script to check the status of a list of URLs."
arch=(x86_64 i686)
url="https://github.com/Arthurdw/statusof"
license=('MIT')
depends=('python-aiohttp' 'python-colorama')
makedepends=('git' 'python-setuptools')
optdepends=('python-aiodns: for fast DNS resolving')
_commit=904e3a53c04a26e2a7d3420cffccfcad3a756af1
source=("git+https://github.com/Arthurdw/statusof.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
    cd "$_name"

    python setup.py build
}

package() {
    cd "$_name"

    python setup.py install --root="$pkgdir" --skip-build --optimize=1
}
