# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributer: Ekin Dursun <ekindursun@gmail.com>
# Contributer: Oliver Mangold omangold at gmail dot com

_pkgname='xdis'
pkgname="python-${_pkgname}"
pkgver=5.0.4
pkgrel=1
pkgdesc='Python cross-version bytecode library and disassembler'
arch=('any')
url='https://github.com/rocky/python-xdis'
license=('GPL2')
depends=('flake8'
        'python-click'
        'python-nose'
        'python-six')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('9074c15d92111877adf9e6a3156106acde8f87fc279a4ec03538f3faa1a5bfca')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.rst'
}

# vim: ts=2 sw=2 et:
