# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor : Jason Chu <jason@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=gscanbus
pkgver=0.8
pkgrel=1
pkgdesc="gscanbus is a little bus scanning, testing and topology visualizing tool for the Linux IEEE1394 subsystem"
arch=('i686' 'x86_64')
depends=('libraw1394>=1.2.0' 'gtk2')
source=(http://downloads.sourceforge.net/project/gscanbus.berlios/$pkgname-$pkgver.tar.gz)
md5sums=('086bed2bcfb43f2ae892a12de699630e')
url="http://gscanbus.berlios.de/"
license=('GPL')

build() {
    cd ${srcdir}/$pkgname-$pkgver
    ./configure --prefix=/usr --sysconfdir=/etc/gscanbus
    make
}

package() {
    cd ${srcdir}/$pkgname-$pkgver
    make DESTDIR=${pkgdir} install
}

