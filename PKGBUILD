# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Chris Warrick <aur@chriswarrick.com>

pkgname=python2-cloudpickle
_pkgname=cloudpickle
pkgver=1.2.2
pkgrel=1
pkgdesc='Extended pickling support for Python 2.x objects'
arch=('any')
url='https://github.com/cloudpipe/cloudpickle'
license=('BSD')
makedepends=('python2-setuptools')
depends=('python2-setuptools')
options=(!emptydirs)
source=("https://pypi.io/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('922401d7140e133253ff5fab4faa4a1166416066453a783b00b507dca93f8859')

build() {
  cd "${_pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

