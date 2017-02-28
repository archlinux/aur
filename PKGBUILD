# Maintainer: Dacoda Strack <dacoda.strack@gmail.com>

pkgname=cl-vectors
pkgver=0.1.5
pkgrel=1
pkgdesc="Pure Common Lisp anti-aliasing rasterizer"
arch=('any')
url="http://projects.tuxee.net/cl-vectors/"
license=('MIT')
depends=()
# makedepends=()
# checkdepends=()
# optdepends=()
provides=()
conflicts=()
# replaces=()
# backup=()
# options=()
# install=
# changelog=
source=("git+https://github.com/fjolliton/cl-vectors.git#commit=0fda45f84b5cc35fb15e387f20a6b66fa8941a02")
# noextract=()
md5sums=(SKIP)
# validpgpkeys=()

pkgver() {
  cd ${pkgname}
  echo $(cat VERSION)
}

package() {
  cd ${pkgname}

  # install documentation
  install -d ${pkgdir}/usr/share/doc/$pkgname/
  install -m644 -t ${pkgdir}/usr/share/doc/$pkgname/ README 
  install -m644 -t ${pkgdir}/usr/share/doc/$pkgname/ MANIFEST

  # install sources
  install -d ${pkgdir}/usr/share/common-lisp/source/${pkgname}
  install -d ${pkgdir}/usr/share/common-lisp/systems
  
  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${pkgname} *.lisp
  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${pkgname} *.asd

  # link asd files
  cd ${pkgdir}/usr/share/common-lisp/systems
  ln -s ../source/${pkgname}/*.asd .
}
