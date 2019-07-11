# Maintainer: Sonny Piers <sonny@fastmail.net>

pkgname=gnomit
pkgver=1.0.7
pkgrel=1
pkgdesc="A simple Git commit message editor for Gnome, written in GJS and inspired by the excellent Komet app for macOS."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://source.ind.ie/gnome/gnomit"
license=('GPL3')
depends=('gjs')
makedepends=('git' 'meson')
source=("https://source.ind.ie/gnome/$pkgname/gjs/-/archive/$pkgver/gjs-$pkgver.tar.bz2")
sha256sums=('5b0d069b3d0c232356c2af3b37f1e5823e5b3259bb30a6edd4c08c5948797c8e')

prepare() {
  cd "gjs-$pkgver"
}

build() {
  cd "gjs-$pkgver"

  meson --prefix=/usr/ build
  ninja -C build
}

package(){
  cd "gjs-$pkgver"

  DESTDIR="$pkgdir" meson install -C build
}
