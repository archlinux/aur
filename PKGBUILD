# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=fbctrl
pkgver=0.1.1
pkgrel=5
pkgdesc="a lightweight utility to switch the windows or desktops on top of any compatible window manager like fluxbox, blackbox or openbox"
url="https://babelize.org/fbctrl.php"
arch=('i686' 'x86_64')
license=('GPL2')
source=("http://babelize.org/download/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('92a052ee0e2fb79826144bffb3cd31f6')
depends=('libx11')

build() {
cd $srcdir/${pkgname}-$pkgver
./configure --prefix=/usr --mandir=/usr/share/man
make
}

package() {
cd $srcdir/${pkgname}-$pkgver
make DESTDIR=${pkgdir} install
}
