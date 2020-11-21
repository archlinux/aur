# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Serge Victor <arch@random.re>

_pkgname='addict'
pkgname="python-${_pkgname}"
pkgver=2.4.0
pkgrel=1
pkgdesc='A Python Dict whos keys can be set both using attribute and item syntax'
arch=('any')
url='https://github.com/mewwts/addict'
_url_pypi='https://pypi.org/project/addict'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b3b2210e0e067a281f5646c8c5db92e99b7231ea8b0eb5f74dbdf9e259d4e494')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
