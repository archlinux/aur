# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=nerolinux3
pkgver=3.5.3.1
pkgrel=1
pkgdesc="Nero Burning ROM for linux (legacy version)"
url="http://www.nero.com"
license=('custom')
depends_i686=('gtk2')
depends_x86_64=('lib32-gtk2')
conflicts=('nerolinux')
provides=('nerolinux')
makedepends=('rpmextract')
arch=('i686' 'x86_64')
source=("nerolinux-${pkgver}-1.i386.rpm"::'https://soft.sibnet.ru/get/?id=19137')
md5sums=('73c1090e85fbf7c1df130374117ce93b')
install=nerolinux.install

package() {
  cd "$pkgdir"
  rpmextract.sh "$srcdir/nerolinux-${pkgver}-1.i386.rpm"

  chmod a+rx -R *
  find . -type f -exec chmod -x \{\} \;
  chmod +x usr/bin/{nero,nerocmd}

  mkdir -p usr/share/licenses/nerolinux
  mv usr/share/doc/nero/EULA* usr/share/licenses/nerolinux
}
