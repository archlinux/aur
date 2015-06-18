# Maintainer: Sébastien Luttringer

pkgname=archversion-git
pkgver=2013.12.17
pkgrel=1
pkgdesc='Archlinux Version Controller (Git version)'
arch=('any')
url='https://github.com/seblu/archversion'
license=('GPL2')
depends=('python' 'pyalpm' 'python-xdg')
makedepends=('git')
source=('git+https://github.com/seblu/archversion.git')
md5sums=('SKIP')

pkgver() {
  date +%Y.%m.%d
}

build() {
  cd ${pkgname%-git}
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname%-git}
  make install DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:
