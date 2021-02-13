# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Unknown47 <unknown47r@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=pcmanfm-gtk3
_pkgname=pcmanfm
pkgver=1.3.2
pkgrel=1
pkgdesc='Extremely fast and lightweight file manager (GTK+ 3 version)'
arch=('x86_64')
url='https://lxde.org/'
license=('GPL')
groups=('lxde-gtk3')
depends=('libfm-gtk3' 'lxmenu-data')
makedepends=('intltool')
optdepends=('gvfs: for trash support, mounting with udisks and remote filesystems'
            'xarchiver: archive management')
conflicts=($_pkgname)
source=(https://downloads.sourceforge.net/$_pkgname/$_pkgname-$pkgver.tar.xz)
sha256sums=('14cb7b247493c4cce65fbb5902611e3ad00a7a870fbc1e50adc50428c5140cf7')

build() {
  cd $_pkgname-$pkgver
  ./configure --sysconfdir=/etc --prefix=/usr --with-gtk=3
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
