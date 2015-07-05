# Contributor: henning mueller <henning@orgizm.net>

pkgname=thunar-vcs-plugin
pkgver=0.1.4
pkgrel=2
pkgdesc="SVN and GIT integration for Thunar."
arch=(i686 x86_64)
license=(GPL)
url=http://goodies.xfce.org/projects/thunar-plugins/thunar-vcs-plugin
depends=(thunar git subversion apr)
makedepends=(intltool)
source=(
	http://archive.xfce.org/src/thunar-plugins/thunar-vcs-plugin/0.1/$pkgname-$pkgver.tar.bz2
	$pkgname.install
)
md5sums=(
	b2321096c706e42b85987f0114ab73bc
	70988e8f3be46644620bf85c05efa5b6
)
install=$pkgname.install

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
}
