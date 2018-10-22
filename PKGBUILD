# Maintainer: Radek Podgorny <radek@podgorny.cz

pkgname=vncsnapshot-git
pkgver=r8.26a2ff5
pkgrel=1
pkgdesc='VNC snapshots'
arch=('i686' 'x86_64')
url='https://github.com/rpodgorny/VNCsnapshot'
license=('unknown')
provides=('vncsnapshot')
conflicts=('vncsnapshot')
depends=('libjpeg-turbo')
source=(${pkgname%-git}::git+https://github.com/rpodgorny/VNCsnapshot)
sha256sums=('SKIP')
#options=('!makeflags')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname%-git}
  make
}

package() {
  cd ${pkgname%-git}
  install -d $pkgdir/usr/bin
  cp vncsnapshot $pkgdir/usr/bin/
}
