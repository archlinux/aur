# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Scimmia

pkgname=nerolinux3
pkgver=3.5.3.1
pkgrel=2
pkgdesc="Nero Burning ROM for linux (legacy version)"
url="http://www.nero.com"
license=('custom')
depends_i686=('gtk2' 'pangox-compat')
depends_x86_64=('lib32-gtk2' 'lib32-pangox-compat')
conflicts=('nerolinux')
provides=('nerolinux')
arch=('i686' 'x86_64')
source=("nerolinux-${pkgver}-1.i386.rpm"::'https://soft.sibnet.ru/get/?id=19137')
md5sums=('73c1090e85fbf7c1df130374117ce93b')
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
