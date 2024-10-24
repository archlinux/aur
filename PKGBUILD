# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=fabioz
pkgname=mu-repo
pkgver=1.9.0
_tagname=${pkgname//-/_}_${pkgver//./_}
pkgrel=1
pkgdesc="Tool to help in dealing with multiple git repositories"
arch=(any)
url="http://fabioz.github.io/mu-repo/"
license=('GPL3')
depends=('python')
provides=("${pkgname}=${pkgver}")
conflicts=(${pkgname}-git)
source=("https://github.com/${_orgname}/${pkgname}/archive/${_tagname}.tar.gz")
sha256sums=('5de4aae542a83f408f518485d10819e99f62e658b107db6919ce73197c834296')

package() {
  cd "${srcdir}/${pkgname}-${_tagname}"
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
