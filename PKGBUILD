# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Josip <josipponjavic at gmail dot com>

pkgname=gmimms
pkgver=0.0.9
pkgrel=2
pkgdesc="Frontend to MiMMS (Multimedia Stream ripper)"
arch=('i686' 'x86_64')
url="http://gmimms.sourceforge.net/"
license=('GPL')
depends=('gtk2' 'mimms')
makedepends=('pkgconfig' 'intltool')
options=('!emptydirs')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('2b676c828822158208732e147488504a')


build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
