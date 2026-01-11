# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-odfdo
_name=${pkgname#python-}
pkgver=3.19.0
pkgrel=1
pkgdesc="Python3 library implementing the ISO/IEC 26300 OpenDocument Format standard."
arch=('any')
url="https://github.com/jdum/odfdo"
license=('Apache-2.0')
depends=(python-lxml)
makedepends=(python-build python-installer python-wheel python-uv-build)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4c1811ce9ca52f6cc39544d9899c8da78825712341122d7a398ed7b960443ddd')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
