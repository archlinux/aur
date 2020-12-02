# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

_pkgname='user_agent'
pkgname="python-${_pkgname}"
pkgver=0.1.9
pkgrel=3
pkgdesc='Generate random, valid web user-agent headers'
arch=('any')
url='https://github.com/lorien/user_agent'
_url_pypi='https://pypi.org/project/user_agent'
license=('MIT')
depends=('python-six')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('8f1ad46cc4aef9f99515ea1c74bb8cacc43e23074c335b2ba2db7735ebe9c0d5')

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
