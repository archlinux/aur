# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: Madotsuki <madotsuki at cock dot li>

pkgname=utox
_pkgname=uTox
pkgver=0.6.0
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
optdepends=('gtk3: GTK file picker')
makedepends=('toxcore')
source=("https://github.com/GrayHatter/$_pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('542782fc3d4c9564e050428362c1382828b89b7c9014f2fc3d25a2dedef67c1f')
install="$pkgname.install"

build() {
  cd "$_pkgname-$pkgver"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
