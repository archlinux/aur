# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Ekin Dursun <ekindursun@gmail.com>

pkgname='python-mpv'
pkgver=0.5.2
pkgrel=3
pkgdesc='Python interface to the awesome mpv media player'
arch=('any')
url='https://github.com/jaseg/python-mpv'
_url_pypi='https://pypi.org/project/python-mpv'
license=('AGPL3')
depends=('mpv' 'python')
optdepends=('python-pillow: raw screenshot support')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('10c7ae61eff441602c7188595108391cdede153c15454772d8811c2bcb9e6823')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
