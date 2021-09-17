# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Igor Scabini <furester @ gmail.com>

pkgname=cython3
pkgver=3.0.0a9
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
sha256sums=('fe9ae4e86a331683d12eaff489b17bb8ecfa7af1bd4b8513934b284ed99f2bcc'
            '28b2b065a9853e86d0bc09287e8a21f50ebc1f3cfee3b2ab03b6b917cb9e81d8')

build() {
  cd "cython-$pkgver"
  python setup.py build
}

package() {
  cd "cython-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
