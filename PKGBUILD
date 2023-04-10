# Maintainer: Neal Buchanan <neal.buchanan@gmx.com>

pkgname=markets-git
_pkgname=markets
pkgver=0.5.5
pkgrel=1
pkgdesc="Track stocks, currencies and cryptocurrencies"
arch=('x86_64')
url="https://github.com/tomasz-oponowicz/markets"
license=('GPL3')
depends=('meson' 'vala' 'libgee')
optdepends=()
source=("https://github.com/tomasz-oponowicz/markets/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2cae01a79d72623e81b549de122077afc26b3cf580f760ccdd7ffe369f799bb5')

build() {
  cd $_pkgname-$pkgver
  meson build --prefix=/usr
  cd build
  ninja
}

package() {
  cd  $_pkgname-$pkgver/build
  meson install --no-rebuild --destdir="${pkgdir}"
}

