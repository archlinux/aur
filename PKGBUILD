# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Rodolphe Bréard <packages@what.tf>
pkgname=mlar
pkgver=1.3.0
pkgrel=1
pkgdesc="A pure rust encrypted and compressed archive file utility"
arch=('x86_64')
url="https://github.com/ANSSI-FR/MLA"
license=('LGPL3')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ANSSI-FR/MLA/archive/mlar-v$pkgver.tar.gz")
sha256sums=('0160c893651bd322e84bfe06f53f7edda8de3a5757a6155c6e960f73d9caa89c')

build() {
  cd "MLA-mlar-v$pkgver"
  cargo update
  cargo build --release --bin "$pkgname"
}

package() {
  cd "MLA-mlar-v$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
