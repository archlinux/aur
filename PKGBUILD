# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
pkgname=office-runner
pkgver=1.0.3
pkgrel=1
pkgdesc="Lighthearted tool to temporarily inhibit GNOME's suspend on lid close behavior"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/office-runner"
license=('GPL3')
depends=('gtk3')
makedepends=('gnome-common')
source=("https://gitlab.gnome.org/GNOME/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('63eaf719c71adc98abbc5c4adb538a196fab783f0417cdfd863c6b4b27334189')

build() {
  cd "$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
