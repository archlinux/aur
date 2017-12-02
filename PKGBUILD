# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=opencachemanager-git
pkgver=1.0.16
pkgrel=1
pkgdesc="Easy to use, linux based program for managing your geocaches"
arch=('i686' 'x86_64')
url="https://github.com/andreaspeters/opencache-manager"
license=('GPL')
depends=('mono' 'dbus-sharp' 'shared-mime-info' 'webkit-sharp' 'desktop-file-utils' 'dbus-sharp-glib' 'gconf-sharp')
makedepends=('git')
optdepends=('qlandkartegt: display cache on map'
            'gpsbabel: send cache to GPS')
conflicts=('opencachemanager')
install=$pkgname.install
source=($pkgname::git://github.com/andreaspeters/opencache-manager.git)
md5sums=('SKIP')

build() {
  cd "${srcdir}"/$pkgname

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname

  make DESTDIR="${pkgdir}" install
}
