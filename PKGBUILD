# Maintainer: Alexander Rødseth <rodseth@gmail.com>
pkgname=ninja-open
pkgver=0.7
pkgrel=5
pkgdesc='Quick and dirty replacement for xdg-open'
arch=('x86_64' 'i686')
url='http://roboticoverlords.org/ninjaopen/'
license=('GPL2')
optdepends=('eog' 'evince' 'file-roller' 'deluge' 'gedit' 'wine' 'firefox' 'smplayer' 'vlc' 'gimp')
makedepends=('go')
options=(!strip)
source=("http://roboticoverlords.org/ninjaopen/$pkgname-$pkgver.xz")
sha256sums=('c7c72297d75cfa27f3e66015b61255e02bfec3c13dd7fceeb2013ba3f34c566b')

build() {
  cd "$pkgname-$pkgver"
  go build -o "$pkgname"
}

package() {
  install -Dm755 "$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/xdg-open"
}

# vim:set ts=2 sw=2 et:
