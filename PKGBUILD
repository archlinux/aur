# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=fabioz
pkgname=mu-repo
pkgver=1.8.1
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
sha256sums=('16e392be2722198041c2c995b3b48c481636acade8cfa28cc4059f09cc2c1ee3')

package() {
  cd "${srcdir}/${pkgname}-${_tagname}"
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
