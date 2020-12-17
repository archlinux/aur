# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributer: Ekin Dursun <ekindursun@gmail.com>
# Contributer: Oliver Mangold omangold at gmail dot com

_pkgname='xdis'
pkgname="python-${_pkgname}"
pkgver=5.0.6
pkgrel=1
pkgdesc='Python cross-version bytecode library and disassembler'
arch=('any')
url='https://github.com/rocky/python-xdis'
_url_pypi='https://pypi.org/project/xdis'
license=('GPL2')
depends=('flake8'
        'python-click'
        'python-nose'
        'python-six')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('4f005d3c08c0fc45fb4bf85fca2bed2f7e5340390bd3b900be657950cc6cd78b')

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
