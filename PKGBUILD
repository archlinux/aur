# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=python-torrequest
_pkgname=torrequest
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple Python interface for HTTP(s) requests over Tor"
arch=('any')
url="https://pypi.org/project/torrequest"
license=('MIT')
depends=('python' 'python-pysocks' 'python-requests' 'python-stem')
source=("https://files.pythonhosted.org/packages/a3/d2/00538e47a2c80979231313c346a0abc3927c7b230d69eb923bb5b221ec62/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('3745d4ea3ffda98d7a034363c787adb37aab77bdab40094a4d937392cd4dae82')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
