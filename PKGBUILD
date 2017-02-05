# Maintainer: Stijn Seghers <stijnseghers at gmail dot com>

pkgname=python-pylint-venv
_internal_pkgname=pylint-venv
_commit='ca201b1aca2fa74e088f8e9d6f6c8168eed266b4'
pkgver=1.0
pkgrel=1
pkgdesc='Make pylint respect virtualenvs.'
arch=('any')
url="https://github.com/jgosmann/${_internal_pkgname}"
license=('MIT')
optdepends=('python-pylint: Kind of useless without it'
            'python-virtualenv: Kind of useless without it')
source=("https://pypi.python.org/packages/6b/49/1a6b1b70c52338209e4d9d5a349935dea57d5b9b1f259be9184590065aed/${_internal_pkgname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/jgosmann/${_internal_pkgname}/${_commit}/LICENSE.txt")
md5sums=('6ee3eefeafafb25a3b5479d956986a8f'
         'a1576dc2ff59a0337e90adf06dc97a72')

package() {
  cd "${srcdir}"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${srcdir}/${_internal_pkgname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}" --optimize=1
}
