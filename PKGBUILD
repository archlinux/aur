# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=python-browserforge
_name=${pkgname#python-}
pkgver=1.2.4
pkgrel=1
pkgdesc="Browser header and fingerprint generator that mimics the frequency of different browsers, operating systems, and devices found in the wild.."
arch=(any)
url="https://pypi.org/project/browserforge/"
license=(Apache-2.0)
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('05686473793769856ebd3528c69071f5be0e511260993e8b2ba839863711a0c4')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
