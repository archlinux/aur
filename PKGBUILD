# Maintainer: Evgeniy Alekseev

pkgname=python-pydeps
_pkgname=pydeps
pkgver=3.0.8
pkgrel=1
pkgdesc="python module dependency visualization tool"
arch=('any')
url="https://github.com/thebjorn/pydeps"
license=('BSD2')
depends=('python-pyaml' 'python-stdlib-list')
makedepends=('python-setuptools')
source=("https://github.com/thebjorn/pydeps/archive/refs/tags/v${pkgver}.tar.gz")

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('bde68eb4f1c875b1ed2b0ceff63cee0909af387f3ae8b33a30a37ee5ea4d2d348b609ec13ac067937a348b5763fed50d893396773e7066cc3631fe39cb574163')
