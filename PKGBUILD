# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: Madotsuki <madotsuki at cock dot li>

pkgname=utox
_pkgname=uTox
pkgver=0.8.0
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
sha256sums=('79effa9755beb9b6884a7660ae0e2c0e42a237faa18a4e32fac68dc30c6c0064')
install="$pkgname.install"

build() {
  cd "$_pkgname-$pkgver"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
