# Contributor: Esteban V. Carnevale <alfplayer@mailoo.com>

pkgbase=python-polib
pkgname=(python-polib python2-polib)
_pkgname=polib
pkgver=1.1.0
pkgrel=2
pkgdesc='A library to manipulate gettext files'
url='https://pypi.python.org/pypi/polib'
arch=('any')
license=('MIT')
depends=('python' 'python2')
source=("https://pypi.io/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('fad87d13696127ffb27ea0882d6182f1a9cf8a5e2b37a587751166c51e5a332a')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package_python-polib() {
  depends=('python')
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-polib() {
  depends=('python2')
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
