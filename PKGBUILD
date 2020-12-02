# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='warcio'
pkgname="python-${_pkgname}"
pkgver=1.7.4
pkgrel=2
pkgdesc='Streaming WARC (and ARC) IO library'
arch=('any')
url='https://github.com/webrecorder/warcio'
_url_pypi='https://pypi.org/project/warcio'
license=('APACHE')
depends=('python-six')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e1889dad9ecac654de5b0973247f335a55827b1b14a8203772d18c749143ea51')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
