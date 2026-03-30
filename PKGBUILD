# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-odfdo
_name=${pkgname#python-}
pkgver=3.22.2
pkgrel=1
pkgdesc="Python3 library implementing the ISO/IEC 26300 OpenDocument Format standard."
arch=('any')
url="https://github.com/jdum/odfdo"
license=('Apache-2.0')
depends=(python-lxml)
makedepends=(python-build python-installer python-wheel python-uv-build)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('4dc6e5fdea1dd9ebf14875b16f3b47beed53403811e5eca3924e60e4ffb4eb2ff70c79507a882acb83f4279ec7976cc5daf6420f186289ab8279b5eda2b5eb6e')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
