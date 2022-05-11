# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=warp-share-files
_pkgname=warp
pkgver=0.1.0
pkgrel=1
pkgdesc="Share files with each other effortlessly"
arch=('x86_64')
url="https://gitlab.gnome.org/felinira/warp"
license=('GPL3')
depends=('glib2' 'libadwaita')
makedepends=('meson' 'rust')
checkdepends=('appstream-glib')
source=($url/-/archive/v$pkgver/$_pkgname-v$pkgver.tar)
b2sums=('09b1c462199f2205faa1c6784cd1b5b2501e0f79f29eb80b56a4a334c7104930889a6154c0a93751a3ff4aa9ec64b01dd1574fa2e7317103fbcfc81215dc8c6c')

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
