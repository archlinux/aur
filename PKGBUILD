# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='syllables'
pkgname="python-${_pkgname}"
pkgver=0.1.0
pkgrel=2
pkgdesc='Python package for estimating the number of syllables in a word'
arch=('any')
url='https://github.com/prosegrinder/python-syllables'
_url_pypi='https://pypi.org/project/syllables'
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('4d65e542db97927ccce04f6668bda528f29f346bf7f5d8524c436eabae8a4cd6')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
