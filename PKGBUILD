# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: kusakata <shohei atmark kusakata period com>
# Contributor: jperry <sh.jperry@gmail.com>

pkgname=gworkspace
pkgver=1.0.0
pkgrel=2
pkgdesc="The GNUstep Workspace"
arch=("x86_64")
url="http://www.gnustep.org/experience/GWorkspace.html"
license=('GPL')
depends=(gnustep-base gnustep-back gnustep-gui)
makedepends=('gcc-objc' 'gnustep-make')
provides=(gworkspace)
conflicts=(gworkspace)
source=(ftp://ftp.gnustep.org/pub/gnustep/usr-apps/$pkgname-$pkgver.tar.gz)
md5sums=('94b4f2ae855ce9656082c50033d8a923')

build() {
  cd $srcdir/$pkgname-$pkgver
  # necessary to set environment if not in user startup.
  . /usr/share/GNUstep/Makefiles/GNUstep.sh
  ./configure --prefix=/opt/GNUstep
  make
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  . /usr/share/GNUstep/Makefiles/GNUstep.sh
  make DESTDIR=$pkgdir install
}
