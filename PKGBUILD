#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=nautilus-nutstore
pkgver=5.1.7
pkgrel=1
pkgdesc='Nutstore integration for Nautilus.'
arch=(x86_64)
url='https://www.jianguoyun.com/'
license=(CCPL:by-nd GPL2)
depends=(libnautilus-extension nutstore)
source=("https://www.jianguoyun.com/static/exe/installer/nutstore_linux_src_installer.tar.gz")
sha256sums=('545e0d393f3e529d0c0a8f51fe652749a1067f84c78dfb445ffb6023c5a7bfa1')

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
