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
source=("http://dev.gnutelephony.org/dist/tarballs/$pkgname-$pkgver.tar.gz"{,.sig})
md5sums=('e6792cbd8b705901c205a509bd7f812f'
         'SKIP')
validpgpkeys=('3D937C85BF4A787DF6C7247DFC531209EA8888AD')

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
