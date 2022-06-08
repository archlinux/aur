# Maintainer: Stijn Seghers <stijnseghers at gmail dot com>

pkgname=python-pylint-venv
_internal_pkgname=pylint-venv
pkgver=2.2.0
pkgrel=1
pkgdesc='Make pylint respect virtualenvs.'
arch=('any')
url="https://github.com/jgosmann/${_internal_pkgname}"
license=('MIT')
optdepends=('python-pylint: Kind of useless without it'
            'python-virtualenv: Kind of useless without it')

source=("https://github.com/jgosmann/${_internal_pkgname}/archive/v${pkgver}.tar.gz"
        "https://github.com/jgosmann/${_internal_pkgname}/raw/v${pkgver}/LICENSE.txt")
sha256sums=('50faedcf47d2d99d322d3f0850468ee6e5859e4534bbf007990c17d84f18bb07'
            'b6b087cae10c9386509b0590c190a5ef86075eca6626ecf6afc5254fc5fcc550')

package() {
  cd "${srcdir}"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${srcdir}/${_internal_pkgname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}" --optimize=1
}
