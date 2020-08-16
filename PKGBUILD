# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=pytablewriter-altrow-theme
pkgname=python-${_pkgname}
pkgver=0.0.1
pkgrel=1
pkgdesc='pytablewriter plugin to provide a theme that colored rows alternatively'
arch=('any')
url='https://github.com/thombashi/pytablewriter-altrow-theme'
license=('MIT')
depends=('python' 'python-pytablewriter' 'python-tcolorpy')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('4465bd62b59d22958aa9b09724d0ea3f92c4e9dce371a9d0f3eb8e0f85c010b7')

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
