# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=json_home_client
pkgname="python-${_pkgname}"
pkgver=1.1.1
pkgrel=1
pkgdesc="Client for REST APIs using JSON Home pages per https://tools.ietf.org/html/draft-nottingham-json-home-06"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python' 'python-uritemplate')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/plinss/json_home_client/archive/v${pkgver}.tar.gz")
sha256sums=('0230efc96f060c5afe1019a6de73700ff1de4efb1b845468fa4e4eaa788b0b7f')
b2sums=('70b347b5ac1f220478d1bba4439afa219055af3f580afeac30ec8ca6749a551806fe64f59b28542de92c47832092a698307933bc2a30fc441f7426506689186e')

build() {
  cd "${_pkgname//-/_}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_pkgname//-/_}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
