# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Dominic Brekau <aur@dominic.brekau.de>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=ccrtp
pkgver=2.1.2
pkgrel=4
pkgdesc="An implementation of RTP, the real-time transport protocol from the IETF"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/ccrtp/"
license=('GPL' 'custom')
depends=('ucommon>=6.2.2' 'libgcrypt')
optdepends=("texinfo: handle and view info files")
source=("https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('f035ca0e1b5d37b78e358f07a25b05c5cdaf2c85c4b31cf29f6be17f288a349e'
            'SKIP')
validpgpkeys=('5CF995AAD5CC1E4079F76C38B1732A9CB37C87BA')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -Dm644 COPYING.addendum "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
