# Maintainer:  soloturn@gmail.com
# Contributor: nic96

_basename=kiwix-desktop
pkgname="$_basename-git"
pkgver=2.0
pkgrel=1
pkgdesc="Offline reader for Web content, especially intended to make Wikipedia available offline."
url="https://www.kiwix.org/"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=("qt5-base" "qt5-webengine" "qt5-svg" "qt5-imageformats" "kiwix-lib")
makedepends=("qt5-tools")
conflicts=("$_basename")
provides=("$_basename")

source=("$pkgname::git://github.com/kiwix/$_basename.git")
md5sums=('SKIP')

build() {
  cd $pkgname
  qmake PREFIX=$pkgdir/usr
  make
}

package() {
  cd $pkgname
  make install
}

