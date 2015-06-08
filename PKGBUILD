# Maintainer: Jonathan Steel <jsteel at aur.archlinux.org>
# Contributor: Sebastian Wolf < fatmike303 at gmail dot com >

pkgname=fs-uae
pkgver=2.4.1
pkgrel=1
pkgdesc="Focuses on emulating Amiga games using the accurate emulation code from WinUAE"
arch=('i686' 'x86_64')
url="http://fs-uae.net/"
license=('GPL')
depends=('sdl' 'openal' 'mesa' 'freetype2' 'gtk-update-icon-cache' 'glu')
makedepends=('xorg-xinput')
install=$pkgname.install
source=($url/stable/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('31ac42182043d9d41240d84bd172eab2')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  make 
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir"/ install
}
