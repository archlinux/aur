# Maintainer: Vee Satayamas <veerpub@pm.me>
pkgname=psascan
pkgver=0.1.1
pkgrel=1
pkgdesc="Parallel external memory suffix array construction"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/dominikkempa/psascan"
license=('MIT')
depends=('libdivsufsort')
makedepends=()
optdepends=()
backup=()
options=()
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/dominikkempa/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha256sums=('d22e4e2d8533061e46990d5c7978f591681eaac2cc7904aa17841e409dd30507')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's|-march=native||g' Makefile
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 construct_sa "$pkgdir/usr/bin/construct_sa"
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
