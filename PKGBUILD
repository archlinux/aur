# Contributor:  TDY <tdy@archlinux.info>
# Contributor: Dan Vratil <progdan@progdansoft.com>
# Maintainer:  aksr <aksr at t-com dot me>
pkgname=libviper
pkgver=1.4.6
pkgrel=1
pkgdesc="An API for ncurses/libgpm offering simple window creation and management to quickly create text interfaces."
arch=('i686' 'x86_64')
url="http://libviper.sourceforge.net/"
license=('GPL2')
depends=('glibc>=2.8' 'gpm' 'ncurses>=5.4')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('6b78e595b4e494976acd6f99fc8fdc7e')
sha1sums=('19d9b1fde0470f3e5a0b20e77ce14e08ca99b2fd')
sha256sums=('8cf7fd32de4f811f258c49670fb979dabc942d4dd9b10b28f43d1afe1a3f75cb')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 viper.h "$pkgdir/usr/include/viper.h"
  install -Dm755 $pkgname.so "$pkgdir/usr/lib/$pkgname.so"
}

