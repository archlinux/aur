# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-odfdo
_name=${pkgname#python-}
pkgver=3.26.1
pkgrel=1
pkgdesc="Python3 library implementing the ISO/IEC 26300 OpenDocument Format standard."
arch=('any')
url="https://github.com/jdum/odfdo"
license=('Apache-2.0')
depends=(python-lxml)
makedepends=(python-build python-installer python-wheel python-uv-build)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('cd157d78aaf64c22a939da1d8885638d704958f581b0d177ff5fd9ad7ea58344faa5f6157872a40f1e9dd67972f875390e7e0ce81577ce92c8036180ba35abc5')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
