# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: tsipizic

pkgname='python-yeelight'
pkgver=0.5.4
pkgrel=1
pkgdesc='Python library for controlling YeeLight RGB bulbs'
arch=('any')
url='https://gitlab.com/stavros/python-yeelight'
license=('BSD')
depends=('python' 'python-enum-compat' 'python-future' 'python-ifaddr')

#makedepends=('python-setuptools')
#source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
#sha256sums=('TBA')

makedepends=('git' 'python-setuptools')
_commit='119faeff0d4f9de8c7f6d0580bdecc1c79bcdaea'
source=("git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  python setup.py build
}

package() {
  cd "${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.rst'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
