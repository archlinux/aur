# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=fbctrl
pkgver=0.1.1
pkgrel=6
pkgdesc="a lightweight utility to switch the windows or desktops on top of any compatible window manager like fluxbox, blackbox or openbox"
url="https://babelize.org/fbctrl.php"
arch=('i686' 'x86_64')
license=('GPL2')
source=("https://github.com/mbroemme/fbctrl/archive/fbctrl-0.1.1.tar.gz")
md5sums=('2019d9dde2e5e386aeb4cb0cfea24087')
depends=('libx11')

build() {
cd $srcdir/${pkgname}-${pkgname}-${pkgver}
./autogen.sh
./configure --prefix=/usr --mandir=/usr/share/man
make
}

package() {
cd $srcdir/${pkgname}-${pkgname}-${pkgver}
make DESTDIR=${pkgdir} install
}
