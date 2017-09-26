# Maintainer: Alad Wenter <alad@mailbox.org>
pkgname=howm-x11
pkgver=0.5.1
pkgrel=3
pkgdesc='A lightweight, tiling X11 window manager that mimics vi by offering operators, motions and modes.'
arch=('i686' 'x86_64')
url='https://github.com/HarveyHunt/howm'
license=('GPL')
depends=('xcb-util-wm' 'sxhkd' 'cottage')
checkdepends=('linux-headers')
source=("$pkgname-$pkgver.tar.gz::https://github.com/HarveyHunt/howm/archive/$pkgver.tar.gz")
sha256sums=('0a790c7b67e19fac026e8abd3dca1d97f72ff25e8b6e84b03b5e246e58520181')

build() {
  cd "howm-$pkgver"
  make release
}

package() {
  cd "howm-$pkgver"
  mkdir -p "$pkgdir"/usr/{share/xsessions,bin/}
  make DESTDIR="$pkgdir/" install

  mkdir -p "$pkgdir"/usr/share/howm/examples
  cp -a examples/* "$pkgdir"/usr/share/howm/examples/
}

# vim:set ts=2 sw=2 et:
