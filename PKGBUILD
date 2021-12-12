# Maintainer: Sanjay Pavan <tsppavan7@gmail.com>

pkgname=nsxiv
_pkgname=nsxiv
pkgver=28
pkgrel=1
pkgdesc='Neo (or New or Not) Simple (or Small or Suckless) X Image Viewer'
arch=('x86_64')
license=('GPL2')
conflicts=('nsxiv-git')
url='https://github.com/nsxiv/nsxiv'
depends=('imlib2' 'desktop-file-utils' 'xdg-utils' 'hicolor-icon-theme' 'libexif' 'libxft' 'giflib' 'libwebp')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/nsxiv/nsxiv/archive/v$pkgver.tar.gz")
sha256sums=('38047f60e51854363dd98fb7b3bc9f1cfa9b7d6f9e8788508b6f1e317328dd75')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  ln -s config.def.h config.h
}

build() {
  make -C "$_pkgname-$pkgver"
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install-all
}
