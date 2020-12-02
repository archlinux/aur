# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

_pkgname='pytablereader'
pkgname="python-${_pkgname}"
pkgver=0.30.1
pkgrel=2
pkgdesc='Load structured table data from various file formats'
arch=('any')
url='https://github.com/thombashi/pytablereader'
_url_pypi='https://pypi.org/project/pytablereader'
license=('MIT')
depends=('python-beautifulsoup4'
        'python-dataproperty'
        'python-jsonschema'
        'python-mbstrdecoder'
        'python-path'
        'python-pathvalidate'
        'python-tabledata'
        'python-typepy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('dc0eba98a45b91a25a9c4ed31ee6c1779983d058f8c1dc879394ef386f703e76')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
