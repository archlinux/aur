# Maintainer: Matthew Ellison <matt+aur@arroyonetworks.com>

_pkgname='mongoengine'
pkgname="python-${_pkgname}"
pkgver=0.10.6
pkgrel=2
pkgdesc='An object-document mapper for MongoDB.'
arch=('any')
url='http://mongoengine.org/'
license=('MIT')
depends=('python-pymongo')
makedepends=('python' 'python-setuptools')
source=(https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('007e3ac452c0a670e89c1d9755f7ddfc2f10982e6edda555e3671ee4cf7b12a5')

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py check
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root "${pkgdir}" --optimize=1
  # License Files
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
