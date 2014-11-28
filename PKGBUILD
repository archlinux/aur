# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=opencachemanager
pkgver=1.0.15
pkgrel=1
pkgdesc="Easy to use, linux based program for managing your geocaches"
arch=('i686' 'x86_64')
url="http://opencachemanage.sourceforge.net/"
license=('GPL')
depends=('gnome-sharp' 'gpsbabel' 'mono' 'ndesk-dbus-glib' 'shared-mime-info' 'webkit-sharp' 'desktop-file-utils')
optdepends=('qlandkartegt: display cache on map'
            'gpsbabel: send cache to GPS')
install=$pkgname.install
source=(http://downloads.sourceforge.net/project/opencachemanage/OpenCacheManager/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('621c8dd8fe8be27937177175b3a1c0f495aca5fa94d7d9817aec002429a1999e')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  ./configure --prefix=/usr

  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver

  make DESTDIR=${pkgdir} install
}
