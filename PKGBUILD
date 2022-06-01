# Maintainer: BethHarmon <BethOliviaHarmon at gmail dot com>
# Created from https://aur.archlinux.org/packages/nerolinux3

pkgname=nerolinux4
pkgver=4.0.0.0b
pkgrel=2
pkgdesc="Nero Burning ROM for linux (legacy version)"
url="http://www.nero.com"
license=('custom')
depends_i686=('gtk2' 'pangox-compat')
depends_x86_64=('lib32-gtk2' 'lib32-pangox-compat')
conflicts=('nerolinux')
provides=('nerolinux')
arch=('i686' 'x86_64')
source=("nerolinux-${pkgver}-x86.rpm"::'http://nero-mirror.com/support/NeroLINUX/nerolinux-4.0.0.0b-x86.rpm')
md5sums=('f49f49c588729c2afdbecb546d9b6041')
install=nerolinux.install

prepare() {
  cd "$srcdir"
  chmod a+rx -R *
  find . -type f -exec chmod -x \{\} \;
  chmod +x usr/bin/{nero,nerocmd}
}

package() {
  cd "$pkgdir"
  mv "${srcdir}"/* .
  mkdir -p usr/share/licenses/nerolinux
  mv usr/share/doc/nero/EULA* usr/share/licenses/nerolinux
}
