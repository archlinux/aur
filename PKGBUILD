# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-odfdo
_name=${pkgname#python-}
pkgver=3.25.0
pkgrel=1
pkgdesc="Python3 library implementing the ISO/IEC 26300 OpenDocument Format standard."
arch=('any')
url="https://github.com/jdum/odfdo"
license=('Apache-2.0')
depends=(python-lxml)
makedepends=(python-build python-installer python-wheel python-uv-build)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('e553016b63489f1cfbf76c1eac3fffd24b73098085e72f1661f6804bf648321243afb13a38f7c6d01040b92180a32aa76a88087bd0e7500d4ff52ce960192bd2')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
