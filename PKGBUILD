# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-packageurl
_gitpkgname=packageurl-python
pkgver=0.9.6
pkgrel=1
pkgdesc='A purl aka. Package URL parser and builder'
arch=('any')
url='https://github.com/package-url/packageurl-python'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
conflicts=('python-packageurl-git')
options=('!strip')
source=("${_gitpkgname}-${pkgver}.tar.gz::https://github.com/package-url/packageurl-python/archive/v${pkgver}.tar.gz")
sha512sums=('5dd53130ff5c216f87500bbc3a4285161394434b8d16ae8c7119320edf64cc1c11be225fafcb413f396c0051a831f55adaa77864cbcc6698728f62999db2ab3c')

build() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 mit.LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
