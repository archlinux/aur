# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: Madotsuki <madotsuki at cock dot li>

pkgname=utox
_pkgname=uTox
pkgver=0.3.2
pkgrel=2
pkgdesc='Lightweight Tox client'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/notsecure/uTox"
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
source=("https://github.com/notsecure/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('848025075e21355c3a8aa959092313d66b4ad6ae03630eb30cc3afce750acc68')
install="$pkgname.install"

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
