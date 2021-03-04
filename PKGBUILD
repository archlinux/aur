# Maintainer: Rodolphe Bréard <packages@what.tf>
pkgname=mlar
pkgver=1.1.1
pkgrel=1
pkgdesc="A pure rust encrypted and compressed archive file utility"
arch=('x86_64')
url="https://github.com/ANSSI-FR/MLA"
license=('LGPL3')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ANSSI-FR/MLA/archive/mlar-v$pkgver.tar.gz")
sha256sums=('4a9cb7b6de86ddc23e8e0d483c06360c34aee32af4ae64883565a53b40164bb9')

build() {
  cd "MLA-mlar-v$pkgver"
  cargo update
  cargo build --release --bin "$pkgname"
}

package() {
  cd "MLA-mlar-v$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
