# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-packageurl
_gitpkgname=packageurl-python
pkgver=0.10.0
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
sha512sums=('7d33a6dd3ff91f2a71a128e741a246527e9bafcb52064a48908c398ece92867c6a7d6b91dc9ce7f2b911924de779f45a54f15bd2edb8dc2541c0fd0465f4afc8')

build() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -BI setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 mit.LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
