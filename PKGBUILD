# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-icon-theme-extras
pkgver=3.12.0
pkgrel=5
pkgdesc='Extra GNOME icons for specific devices and file types'
arch=('any')
depends=('gtk-update-icon-cache' 'hicolor-icon-theme')
makedepends=('icon-naming-utils')
url='https://git.gnome.org/browse/gnome-icon-theme-extras'
license=('CCPL:cc-by-sa')
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('4eec6cea8a7b09c4ed6ebab1a3b42539b9c61a53bec4b8872e774611cc619608')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
