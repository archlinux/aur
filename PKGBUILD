# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=irivermanager
pkgver=220810
pkgrel=1
pkgdesc="Simple program written in Qt, which helps managing music on iriver players"
arch=('i686' 'x86_64')
url="http://irivermanager.sourceforge.net/"
license=('GPL')
depends=('qt4')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('5fda840c24c0b45ce092e6cf5cc51e1b8a60a8294c6794bb6ff80c8b0ba39729')

build() {
  cd "${srcdir}"/$pkgname

  qmake-qt4
  make
}

package() {
  cd "${srcdir}"/$pkgname

  install -Dm755 "${srcdir}"/$pkgname/build/$pkgname "${pkgdir}"/usr/bin/$pkgname
}
