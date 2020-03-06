# Maintainer: Mirko Scholz <srtlg>
_pkgname=classdesc
pkgname=classdesc
pkgver=3.37
_commit=3.37
pkgrel=1
pkgdesc="A system for adding reflection to C++"
arch=('x86_64')
url="http://classdesc.sourceforge.net/"
license=('MIT')
makedepends=()
depends=('gcc-libs')
source=("${_pkgname}-${pkgver}.zip::https://github.com/highperformancecoder/classdesc/archive/${_commit}.zip"
'makefile.patch')
sha512sums=('92368da5de14318709daf453aced464c402002fe34744cfd48f51c9b36d6e21125f8c2d1d28481202dd21e5af84611a4dd2cbbcb5f9d661398d906f7560f70da'
            'c0669dec153de6a75a71007b9cd1b3f357e867612255f22cea7f5c18c92bd2a1bb17f13523c8a8ae58497c306eaaf2f654ddae8d6f2c454246fa65348e3585ce')

prepare() {
  cd "${_pkgname}-${_commit}"
  patch --forward --strip=1 --input="${srcdir}/makefile.patch"
}

build() {
  cd "${_pkgname}-${_commit}"
  make 
}

package() {
  cd "${_pkgname}-${_commit}"
  make install "PREFIX=${pkgdir}/usr"
}
