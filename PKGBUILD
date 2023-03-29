# Maintainer: Simon Zack <simonzack@gmail.com>
# Contributor: David Albuquerque <david.alb2011@gmail.com>
# Contributer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributer: Ekin Dursun <ekindursun@gmail.com>
# Contributer: Oliver Mangold omangold at gmail dot com

_pkgname='xdis'
pkgname="python-${_pkgname}"
pkgver=6.0.5
pkgrel=1
pkgdesc='Python cross-version bytecode library and disassembler'
arch=('any')
url='https://github.com/rocky/python-xdis'
_url_pypi='https://pypi.org/project/xdis'
license=('GPL2')
depends=('python-click'
        'python-six')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('c591e10f9c362caf889048d8af8167233d31705119d4a967a2b939754ad9b6c1')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
}
