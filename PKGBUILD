#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=nautilus-nutstore
pkgver=6.2.7
pkgrel=1
pkgdesc='Nutstore integration for Nautilus.'
arch=(x86_64)
url='https://www.jianguoyun.com/'
license=(CCPL:by-nd GPL2)
depends=(libnautilus-extension nutstore)
source=("https://www.jianguoyun.com/static/exe/installer/nutstore_linux_src_installer.tar.gz")
sha256sums=('f5186f590786982e134a0585061e53f9b23f0058d362a97b8ede5f9bf40d8544')

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
