# Maintainer: Eric Anderson <ejona86@gmail.com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgname=python2-pyserial
pkgver=3.5
pkgrel=1
pkgdesc="Multiplatform Serial Port Module for Python"
arch=('any')
url="https://github.com/pyserial/pyserial"
license=('custom:PYTHON')
depends=('python2')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pyserial/pyserial/archive/v$pkgver.tar.gz")
sha256sums=('81cbbb8147f11cbaefea8bacece25adeffeb2b5503a571e686d4658863fdd6c6')

build() {
  cd pyserial-${pkgver}
  python2 setup.py build
}

package() {
  cd pyserial-${pkgver}
  python2 setup.py install --root="$pkgdir" --skip-build
  rm -r "$pkgdir"/usr/bin # Don't conflict with python-pyserial
  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
