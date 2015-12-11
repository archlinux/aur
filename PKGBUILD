# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: Madotsuki <madotsuki at cock dot li>

pkgname=utox
_pkgname=uTox
pkgver=0.4.5
pkgrel=1
pkgdesc='Lightweight Tox client'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/GrayHatter/uTox"
license=('GPL3')
depends=('desktop-file-utils'
         'fontconfig'
         'libfilteraudio-git'
         'hicolor-icon-theme'
         'libdbus'
         'libxext'
         'libxrender'
         'openal'
         'toxcore'
         'v4l-utils')
optdepends=('gtk2: GTK file picker')
makedepends=('toxcore')
source=("https://github.com/GrayHatter/$_pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7d744a4e1c0a4b060434924e25312e336f4a2df3236a152893660c0fb374ece7')
install="$pkgname.install"

build() {
  cd "$_pkgname-$pkgver"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
