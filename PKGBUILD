# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Timur Antipin <kosmocap@gmail.com>
# Contributor: Evans Jahja <evansjahja13@gmail.com>

pkgname=joy2key-git
_pkgname=joy2key
pkgver=0+git.19
pkgrel=1
pkgdesc='Translate joystick movements into keystrokes'
arch=('x86_64' 'i686')
url='https://github.com/joolswills/joy2key'
license=('GPL2')
depends=('libx11' 'xorg-xwininfo')
source=('git+https://github.com/joolswills/joy2key.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  echo "0+git.$(git rev-list HEAD --count)"
}

build() {
  cd "$_pkgname"

  autoreconf --install --symlink
  ./configure --prefix=/usr -x-libraries=/usr/lib
  make
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
