# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=chirurgien
_pkgname=Chirurgien
pkgver=2.0
pkgrel=1
pkgdesc="Chirurgien helps understand and manipulate file formats"
arch=('x86_64')
url="https://github.com/leonardschardijn/Chirurgien"
license=('GPL3')
depends=('gtk4' 'glib2')
makedepends=('meson')
checkdepends=('appstream-glib')
source=(${url}/archive/v${pkgver}.tar.gz)
b2sums=('d8df1e187fa2fe3c02f3ee647abaab3e9b0b25ef1f491550ea3eda0c9bb354c0ddcf99a2465b11cfcc128a23a3338b2c5c76cf59e782f721d16b15e14b48be1d')

build() {
  arch-meson $_pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
