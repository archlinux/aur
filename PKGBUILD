# Maintainer: Sean Enck <enckse@gmail.com>
# Contributor: Matthew Ellison <matt+aur@arroyonetworks.com>

_pkgname='mongoengine'
pkgname="python-${_pkgname}"
pkgver=0.11.0
pkgrel=1
pkgdesc='An object-document mapper for MongoDB.'
arch=('any')
url='http://mongoengine.org/'
license=('MIT')
depends=('python-pymongo')
makedepends=('python' 'python-setuptools')
source=(https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('39532b0d2d26de3bb2bb174fef0209bb1925f81942b999808050d99917c0c6b9')

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
