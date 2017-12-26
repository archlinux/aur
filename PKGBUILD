# Maintainer: Sean Enck <enckse@gmail.com>
# Contributor: Matthew Ellison <matt+aur@arroyonetworks.com>

_pkgname='mongoengine'
pkgname="python-${_pkgname}"
pkgver=0.15.0
pkgrel=1
pkgdesc='An object-document mapper for MongoDB.'
arch=('any')
url='http://mongoengine.org/'
license=('MIT')
depends=('python-pymongo')
makedepends=('python' 'python-setuptools')
source=(https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)

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
md5sums=('5a389655e6c9c4e030b00495553871f0')
