# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: Andreas Wagner <Andreas dot Wagner at em dot uni-frankfurt dot de>

pkgname=lbdb
pkgver=0.54
pkgrel=3
pkgdesc="The little brother's database for the mutt mail reader"
arch=('i686' 'x86_64')
url="http://www.spinnaker.de/lbdb/"
license=('GPL-2.0-only')
depends=('awk' 'bash' 'glibc' 'perl')
optdepends=(
  'libvformat: for reading vcard files [needed at compile time]'
	'inetutils: provides the hostname binary'
	'netkit-bsd-finger: finger module'
)
backup=('etc/lbdb.rc' 'etc/lbdb_ldap.rc')
source=(https://github.com/RolandRosenfeld/lbdb/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('1579c38655d5cf7e2c6ca8aabc02b6590c8794ef0ae1fbb0c4d99226ffce5be7')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --libdir=/usr/lib/$pkgname \
  --mandir=/usr/share --sysconfdir=/etc
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make install_prefix=$pkgdir install
}

# vim:set ts=2 sw=2 et:
