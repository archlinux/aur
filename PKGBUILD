# Contributor: henning mueller <henning@orgizm.net>

pkgname=thunar-vcs-plugin
pkgver=0.1.5
pkgrel=1
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

sha256sums=('7094f576865957397eefcdb1b05ba9be020a396c12949077507ea1573b1ef451'
            '9236743ff2218aa974f15227a57a1f364744c3459a1ed94ac9a087aa2b1be3c4')
