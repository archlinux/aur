# Maintainer: Matthew Ellison <seglberg@gmail.com>

_pkgname='Cerberus'
pkgname="python-cerberus"
pkgver=1.1
pkgrel=1
pkgdesc='Lightweight, extensible data validation library for Python'
arch=('any')
url='http://docs.python-cerberus.org/en/stable/'
license=('ISC')
depends=()
makedepends=('python' 'python-setuptools')
source=("https://pypi.io/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a5b39090fde3ec3294c9d7030b8eda935b42222160a66a922e0c8aea34cabfdf')

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py check
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root "${pkgdir}" --optimize=1
  # License Files
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
