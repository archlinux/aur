# Maintainer: Thor M. K. Høgås <thor alfakrøll roht dott no>
pkgname=koku-xinput-wine
pkgver=2016.03.25.ca7cd49
pkgrel=1
pkgdesc="Adds xinput support to Wine, without modifying the source binaries of Wine."
arch=('i686' 'x86_64')
url="https://www.github.com/KoKuToru/koku-xinput-wine"
license=('GPL3')
makedepends=('git' 'cmake')
depends=('sdl2' 'lib32-sdl2' 'lib32-glibc')
source=("$pkgname::git://github.com/KoKuToru/koku-xinput-wine")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git log -1 --format="%cd.%h" --date=short | sed 's:-:.:g'
}

build() {
  cd "$pkgname"
  cmake .
  make
} 

package() {
  cd "$pkgname"
  install -Dm755 koku-xinput-wine.so "$pkgdir/usr/lib32/koku-xinput-wine.so"
}
