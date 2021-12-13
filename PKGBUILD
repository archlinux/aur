# Maintainer: Simon Zack <simonzack@gmail.com>
# Contributor: David Albuquerque <david.alb2011@gmail.com>
# Contributer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributer: Ekin Dursun <ekindursun@gmail.com>
# Contributer: Oliver Mangold omangold at gmail dot com

_pkgname='xdis'
pkgname="python-${_pkgname}"
pkgver=6.0.3
pkgrel=1
pkgdesc='Python cross-version bytecode library and disassembler'
arch=('any')
url='https://github.com/rocky/python-xdis'
_url_pypi='https://pypi.org/project/xdis'
license=('GPL2')
depends=('python-click'
        'python-nose'
        'python-six')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('97f776f1c626e6a9e3babd0c1ca5ef394e879d7027580c54ae0be873122f9ebc')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
}
