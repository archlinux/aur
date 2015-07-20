# $Id$
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Unknown47 <unknown47r@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=pcmanfm-gtk3
_pkgname=pcmanfm
pkgver=1.2.3
pkgrel=1
pkgdesc='Extremely fast and lightweight file manager (GTK+ 3 version)'
arch=('i686' 'x86_64')
url='http://pcmanfm.sourceforge.net/'
license=('GPL')
groups=('lxde-gtk3')
depends=('gtk3' 'desktop-file-utils' 'libfm-gtk3' 'lxmenu-data')
makedepends=('intltool')
optdepends=('gvfs: for trash support, mounting with udisks and remote filesystems'
            'udisks: alternative for mounting volumes'
            'xarchiver: archive management')
conflicts=($_pkgname)
provides=($_pkgname)
install=$_pkgname.install
source=(http://downloads.sourceforge.net/$_pkgname/$_pkgname-$pkgver.tar.xz)
md5sums=('c993402d407b0a3fc076f842ac1bc5c9')

build() {
  cd $_pkgname-$pkgver
  ./configure --sysconfdir=/etc --prefix=/usr --with-gtk=3
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
