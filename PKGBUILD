# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=fabioz
pkgname=mu-repo
pkgver=1.8.0
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
sha256sums=('71d86c46cc9429f148efa5388de5c5a177754a18e944347f84eddd13ec5ca6e2')

package() {
  cd "${srcdir}/${pkgname}-${_tagname}"
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
