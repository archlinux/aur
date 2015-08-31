# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=ccrtp
pkgver=2.1.2
pkgrel=1
pkgdesc="An implementation of RTP, the real-time transport protocol from the IETF"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/ccrtp/"
license=('GPL' 'custom')
depends=('ucommon>=6.2.2' 'libgcrypt')
install=$pkgname.install
source=("http://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz"{,.sig})
md5sums=('e6792cbd8b705901c205a509bd7f812f'
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
