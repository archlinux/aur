# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Douglas Soares de Andrade <dsandrade@gmail.com>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgname=python38-pyserial
pkgver=3.5
pkgrel=4
pkgdesc="Multiplatform Serial Port Module for Python"
arch=('any')
url="https://github.com/pyserial/pyserial"
license=('custom:PYTHON')
depends=('python38')
makedepends=('python38-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pyserial/pyserial/archive/v$pkgver.tar.gz")
sha256sums=('81cbbb8147f11cbaefea8bacece25adeffeb2b5503a571e686d4658863fdd6c6')

build() {
  cd pyserial-${pkgver}
  python3.8 setup.py build
}

package() {
  cd "$srcdir"/pyserial-${pkgver}
  python3.8 setup.py install --root="$pkgdir" --skip-build
  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
