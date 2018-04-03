# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: Andreas Wagner <Andreas dot Wagner at em dot uni-frankfurt dot de>

pkgname=lbdb
pkgver=0.47
pkgrel=1
pkgdesc="The little brother's database for the mutt mail reader"
arch=('i686' 'x86_64')
url="http://www.spinnaker.de/lbdb/"
license=('GPL')
depends=('awk' 'perl')
optdepends=('libvformat: for reading vcard files (needed at compile time)' \
	    'inetutils: provides the hostname binary' \
	    'netkit-bsd-finger: finger module' )
backup=('etc/lbdb.rc' 'etc/lbdb_ldap.rc')
source=(http://www.spinnaker.de/lbdb/download/${pkgname}_${pkgver}.tar.gz)
md5sums=('988277135b5c43ae5ba67b4ce295f866')

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
