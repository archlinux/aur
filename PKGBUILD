# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=done
pkgver=0.1.1
pkgrel=1
pkgdesc="Done is a simple to do app that aims to improve on the existing set of features provided to do apps to deliver the ultimate experience."
arch=('x86_64')
url="https://github.com/edfloreshz/done"
license=('GPL2')
depends=('libadwaita' 'sqlite')
makedepends=('cargo' 'meson')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('9e60e2ffa79a17e0c80348456445098216b7ff32db7a0a52361f767d16caa0ddd3fdfd0049663b77fb9feaedb841d30821f2e06c6531e8f578ce46e8aa152fb1')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}