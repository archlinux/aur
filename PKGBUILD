# See AUR for current maintainer
# Previus maintainer: eagletmt <eagletmt@gmail.com>

pkgname=emacs-riece
_pkgname=riece
pkgver=9.0.0
pkgrel=1
pkgdesc='an IRC client for Emacs'
arch=('any')
url='http://www.nongnu.org/riece/index.html'
license=('GPL')
depends=('emacs')
optdepends=('ruby: for some add-ons')
source=(http://dl.sv.gnu.org/releases/riece/${_pkgname}-${pkgver}.tar.gz)
install=emacs-riece.install
sha256sums=('88928dc21df3f3b15158e64b77268882544e6afa1d93f3545435ce430837fd2d')

prepare() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  ./configure --prefix=/usr
}

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  make DESTDIR=${pkgdir} lispdir=${pkgdir}/usr/share/emacs/site-lisp install
}
