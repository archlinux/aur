# Maintainer: Gilles Quenot <gilles.quenot@sputnick.fr>
pkgname=heyu
pkgver=2.11_rc3
_pkgver=2.11-rc3
pkgrel=3
pkgdesc="X10 Automation for Linux, Unix, and Mac OS X"
arch=(i686 x86_64)
url="http://www.heyu.org/"
license=('GPLv3')
provides=("heyu")
depends=()
makedepends=('make')
conflicts=('heyu')
source=("https://github.com/HeyuX10Automation/heyu/archive/v${_pkgver}.tar.gz")
md5sums=('7a88fcfe7133ca7a149e1c102de2ba0d')

prepare() { true; }

build() {
  cd $srcdir/$pkgname-$_pkgver
  ./configure --localstatedir=/var --mandir=/usr/share/man --enable-postinst=./post-install.sh --sysconfdir=/etc --prefix=/usr
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$_pkgver
  make DESTDIR="$pkgdir/" install
}
