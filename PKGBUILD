# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Raizen <flakeroats@hotmail.com>

pkgname=desklaunch
pkgver=1.1.7
pkgrel=1
pkgdesc="Small utility for creating desktop icons using pixmaps"
arch=('i686' 'x86_64')
url="http://www.oroborus.org/"
license=('GPL2')
depends=('libxpm')
options=('!emptydirs')
source=(http://ftp.debian.org/debian/pool/main/d/$pkgname/${pkgname}_${pkgver}.tar.gz)
sha256sums=('4f5805a58398ce0b3807e52c44783529a7fca690848a3ed6e5eabbd568f45c9e')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  install -d "${pkgdir}"/usr/bin
  make DESTDIR="${pkgdir}" install
}
