# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

pkgname=gtk2fontsel
pkgver=0.1
pkgrel=5
pkgdesc="Font selection and preview tool"
arch=('x86_64')
url="http://gtk2fontsel.sourceforge.net/"
license=('GPL')
depends=('gtk2')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz gtk2fontsel.desktop)
sha256sums=('5cd6396fc3c6e7f9bc358cc5ad30592ba446cdb0138a811216497b6453905a68'
            'b827567c26b929256c5df3837019d7f9531ecf5ba5d7ba4a16f339ea0288d332')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver

  make prefix=${pkgdir}/usr install
  install -D -m644 ${srcdir}/gtk2fontsel.desktop \
    ${pkgdir}/usr/share/applications/gtk2fontsel.desktop
}
