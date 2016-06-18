# Maintainer: Aaron Fischer <mail@aaron-fischer.net>

pkgname=frikqcc
pkgver=2.7
pkgrel=1
pkgdesc="A QuakeC compiler"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.insideqc.com/frikbot/projects.php"
makedepends=('gcc-libs')
source=(http://www.insideqc.com/frikbot/frikqcc/frikqcc27src.zip
        blah-nonsense.patch)
md5sums=('84860d137994c2b5d4404cb51a97a212'
         'b36d38b08d580f3b34d8c03294c4000b')

build() {
  patch "${srcdir}/frikqcc27src/compiler/qcc.c" < blah-nonsense.patch
  cd "${srcdir}/frikqcc27src/compiler"
  make
}

package() {
  cd "${srcdir}/frikqcc27src/compiler"
  install -Dm755 frikqcc "${pkgdir}/usr/bin/frikqcc"
}
