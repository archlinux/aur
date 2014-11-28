# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=valknut
pkgver=0.4.9
pkgrel=1
pkgdesc="A direct connect client for Linux (like dc++), with segmented downloading."
license=('GPL')
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/wxdcgui/"
depends=('qt' 'dclib>=0.3.23')
replaces=('dcgui-qt')
source=(http://downloads.sourceforge.net/sourceforge/wxdcgui/$pkgname-$pkgver.tar.bz2)

md5sums=('c25d68c447cb9deb4262befdde9fccea')

build() {
  cd "${srcdir}/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make prefix="${pkgdir}/usr" install
}
