# Maintainer: Michał Walenciak <kicer86@gmail.com>
pkgname=python-velocyto
pkgver=0.17.17
pkgrel=1
pkgdesc="Velocyto is a library for the analysis of RNA velocity."
arch=('x86_64')
url="https://velocyto.org/velocyto.py"
license=('BSD-2-Clause license')
makedepends=('python-setuptools')
depends=('python')
source=("https://github.com/velocyto-team/velocyto.py/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2461eabf2ec6b152240c95f7ad8a0a5768a83c72822d9398beec2981732b890d')

build() {
    cd velocyto.py-"$pkgver"
    python setup.py build
}

package() {
    cd velocyto.py-"$pkgver"
    python setup.py install --root="$pkgdir" --prefix=/usr --skip-build
}
