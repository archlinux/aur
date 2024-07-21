#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=nautilus-nutstore
pkgver=6.3.0
pkgrel=2
pkgdesc='Nutstore integration for Nautilus.'
arch=(x86_64)
url='https://www.jianguoyun.com/'
license=(CCPL:by-nd GPL2)
depends=(libnautilus-extension nutstore)
source=("https://www.jianguoyun.com/static/exe/installer/nutstore_linux_src_installer.tar.gz")
sha256sums=('752a6da615d88d4768a38b586c65324d4fa48a6fe721ed6e724704350f3b5f73')

build() {
    cd $srcdir/nutstore_linux_src_installer
    ./configure || return 1
    make || return 1
}

package() {
    cd $srcdir/nutstore_linux_src_installer
    make DESTDIR=$pkgdir install
    install -D -m 644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
