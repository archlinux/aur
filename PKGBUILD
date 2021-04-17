# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Gustavo Peredo <gustavomperedo@protonmail.com>

pkgname=font-downloader-git
_pkgname=font-downloader
pkgver=4.3.0
pkgrel=1
pkgdesc="A simple GTK font downloader"
arch=('any')
url="https://github.com/GustavoPeredo/font-downloader"
license=('GPL3')
depends=('gtk3' 'libhandy' 'python3')
makedepends=('cmake' 'git' 'meson' 'ninja')
install=
_commit=a680009a3b22c68d34e464c77fd5f417fd04bcd7
source=("git+https://github.com/GustavoPeredo/font-downloader.git/#commit=$_commit")
b2sums=('SKIP')

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" ninja install -C build
}