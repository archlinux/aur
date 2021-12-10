# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=sherlock
pkgver=1.2.0
pkgrel=1
pkgdesc='Find information about public IP addresses'
arch=('x86_64')
url='https://github.com/sergius02/Sherlock'
license=('GPL3')
depends=('glib2' 'gtk3' 'libsoup' 'json-glib')
makedepends=('meson' 'vala')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('230c39448640cace1d9b27424f990f79be2278bb45752eb241cfe159cd3f33ae')

build() {
  arch-meson "Sherlock-$pkgver" build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "Sherlock-$pkgver/README.md"
}

# vim: ts=2 sw=2 et:
