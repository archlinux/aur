# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: Andreas Wagner <Andreas dot Wagner at em dot uni-frankfurt dot de>

pkgname=lbdb
pkgver=0.49.1
pkgrel=1
pkgdesc="The little brother's database for the mutt mail reader"
arch=('i686' 'x86_64')
url="http://www.spinnaker.de/lbdb/"
license=('GPL')
depends=('awk' 'perl')
optdepends=(
  'libvformat: for reading vcard files [needed at compile time]'
	'inetutils: provides the hostname binary'
	'netkit-bsd-finger: finger module' 
)
backup=('etc/lbdb.rc' 'etc/lbdb_ldap.rc')
source=(http://www.spinnaker.de/lbdb/download/${pkgname}_${pkgver}.tar.gz)
sha256sums=('e2a57a2935d52ae5fbcc76d84ee06955d943c4696d0b43c7c1de5b8bc7f0f31e')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make install_prefix=$pkgdir install
}

# vim:set ts=2 sw=2 et:
