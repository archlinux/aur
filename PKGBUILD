# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=pigterm
pkgver=1.0.1
pkgrel=1
pkgdesc="Remote assistant for Linux console"
arch=('i686' 'x86_64')
url="http://pigterm.sourceforge.net/"
license=('GPL3')
depends=('qt4' 'qca-ossl')
source=(http://sourceforge.net/projects/$pkgname/files/${pkgname}_${pkgver}.tar.gz)
sha256sums=('1ac1809264cb7efaf8e47c993d6d879a347388a288c6599d1aa35d24fef1084f')

build() {
  cd "${srcdir}/$pkgname"

  qmake-qt4
  make
}

package() {
  cd "${srcdir}/$pkgname"

  install -D -m755 $pkgname ${pkgdir}/usr/bin/$pkgname
}
