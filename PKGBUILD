# Contributors:
#	henning mueller <henning@orgizm.net>

pkgname=imvirt
pkgver=0.9.0
pkgrel=2
pkgdesc='Detect the virtualization technology of a machine, it is run in.'
arch=(i686 x86_64)
license=(GPL)
url=http://micky.ibh.net/~liske/imvirt.html
depends=(perl)
makedepends=()
source=(
	http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz/download
)
md5sums=(
	025e3e264593d149053b87ae5fae96ba
)

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr --libexecdir=/usr/lib/$pkgname
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
}
