# See AUR for current maintainer
# Previus maintainer: eagletmt <eagletmt@gmail.com>

pkgname=emacs-riece
_pkgname=riece
pkgver=9.0.0
pkgrel=2
pkgdesc='an IRC client for Emacs'
arch=('any')
url='https://www.nongnu.org/riece/'
license=('GPL')
depends=('emacs')
optdepends=('ruby: for some add-ons')
source=("https://download.savannah.gnu.org/releases/riece/${_pkgname}-${pkgver}.tar.gz")
install=emacs-riece.install
b2sums=('eaa54c7f5b445657b0a1e09914b145ccaa88a26c5f14d7b6c37061c25b90210f4fd0ec9bb6867ed881212314d0f4d9fe81f60fbde64accf8091d72cc6f9a8576')

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
