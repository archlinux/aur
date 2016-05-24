# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: Madotsuki <madotsuki at cock dot li>

pkgname=utox
_pkgname=uTox
pkgver=0.9.3
pkgrel=1
pkgdesc='Lightweight Tox client'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/GrayHatter/uTox"
license=('GPL3')
depends=('desktop-file-utils'
         'fontconfig'
         'libfilteraudio'
         'hicolor-icon-theme'
         'libdbus'
         'libxext'
         'libxrender'
         'openal'
         'toxcore'
         'v4l-utils')
optdepends=('gtk3: GTK file picker')
makedepends=('toxcore')
source=("https://github.com/GrayHatter/$_pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('805ae4122fb4088dacc82c432e754fc0950b6c7089f0ae878dbe8a8d6b513bfc')

build() {
  cd "$_pkgname-$pkgver"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
