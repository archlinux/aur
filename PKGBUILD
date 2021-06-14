# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Igor Scabini <furester @ gmail.com>

pkgname=cython3
pkgver=3.0a7
pkgrel=1
pkgdesc="C-Extensions for Python"
arch=(x86_64)
url="https://cython.org"
license=(APACHE)
depends=('python')
makedepends=(python-setuptools)
provides=('cython')
conflicts=('cython')
source=($pkgname-$pkgver.tar.gz::"https://github.com/cython/cython/archive/$pkgver.tar.gz"
        cython-hash-int-conversion.patch::"https://github.com/cython/cython/commit/28251032.patch")
sha256sums=('a741452364c8b3e345936ae7e7a24444f4dee37c762db0f1520340ad0c0ede48'
            '28b2b065a9853e86d0bc09287e8a21f50ebc1f3cfee3b2ab03b6b917cb9e81d8')

build() {
  cd "cython-$pkgver"
  python setup.py build
}

package() {
  cd "cython-$pkgver"
  python setup.py install --root="$pkgdir" --skip-build
}
