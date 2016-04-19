# Maintainer: Matthew Ellison <matt+aur@arroyonetworks.com>

_pkgname='Cerberus'
pkgname="python-cerberus"
pkgver=0.9.2
pkgrel=1
pkgdesc='Lightweight, extensible data validation library for Python'
arch=('any')
url='http://docs.python-cerberus.org/en/stable/'
license=('ISC')
depends=()
makedepends=('python' 'python-setuptools')
source=("https://pypi.python.org/packages/source/C/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b122c7b2cbf856ea2587e187fac968fc8dcd49d47aa1f239abd9eaa0ed86a7ce')

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
