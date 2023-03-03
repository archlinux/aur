# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=fabioz
pkgname=mu-repo
pkgver=1.8.2
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
sha256sums=('86d15f3862c52ecd07b74389b7120b299f7fe4c7368fb40e31f993684bf079c9')

package() {
  cd "${srcdir}/${pkgname}-${_tagname}"
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
