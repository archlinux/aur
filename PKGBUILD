# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=tcolorpy
pkgname=python-${_pkgname}
pkgver=0.0.7
pkgrel=1
pkgdesc='Python library to apply true color for terminal text'
arch=('any')
url='https://github.com/thombashi/tcolorpy'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('3e7745620908d3a7883558e2e9217c8d6186c3060dc32f71b52d766970a78a2d')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.rst'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
