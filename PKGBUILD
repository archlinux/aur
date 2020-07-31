# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=humanreadable
pkgname=python-${_pkgname}
pkgver=0.1.0
pkgrel=1
pkgdesc='Convert from human-readable values to different unit'
arch=('any')
url='https://github.com/thombashi/humanreadable'
license=('MIT')
depends=('python' 'python-typepy')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('80f10a1575ebb140d9345a347f981dc6faa70d090885490d77f63361290b4ff7')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 'README.rst' "${pkgdir}/usr/share/doc/${_pkgname}/README.rst"
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
