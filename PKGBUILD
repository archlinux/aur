# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=clairvoyant
pkgver=3.1.3
pkgrel=1
pkgdesc="Magic 8-Ball fortune teller of sorts"
arch=('x86_64' 'aarch64')
url="https://github.com/cassidyjames/clairvoyant"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'vala')
source=($url/archive/$pkgver.tar.gz)
b2sums=('fdf34bdfd859506d3bcf246202b78c947fe42a3b84aa5b8a7b7e4563c623654d7828fb79b9145b5ada2f87f84187b62f9234a9873450dc91ea79296398a80718')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
