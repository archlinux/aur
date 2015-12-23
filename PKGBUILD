# Maintainer: Narazaka <https://narazaka.net/>

pkgname=qvwm
pkgver=1.1.12.1
pkgrel=1
pkgdesc="Qvwm is a Windows 95/98/NT like window manager for X Window System."
url="https://github.com/mytoh/qvwm"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('imlib' 'libxpm' 'bison' 'flex' 'libxss')
source=(https://github.com/mytoh/qvwm/archive/master.zip)

build() {
  cd "${srcdir}/qvwm-master"
  sh ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib 
  make
}

package() {
  cd $startdir/src/qvwm-master
  make DESTDIR="${pkgdir}" install
}

sha1sums=('884facbeae66cac9ea888264a8f980b3c94a2d5e')
