# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=readmemaker
pkgname=python-${_pkgname}
pkgver=1.0.2
pkgrel=1
pkgdesc='Python utility library to help make a README file from document files'
arch=('any')
url='https://github.com/thombashi/readmemaker'
license=('MIT')
depends=('python' 'python-path')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ffb1a939393ff176d6c8d5bb86028fff89ef04112fbc97e4de2ab9c9eb8bffe2')

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
