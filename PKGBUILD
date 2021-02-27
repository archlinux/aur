# Maintainer: Rodolphe Bréard <packages@what.tf>
pkgname=mlar
pkgver=1.1.0
pkgrel=1
pkgdesc="A pure rust encrypted and compressed archive file utility"
arch=('x86_64')
url="https://github.com/ANSSI-FR/MLA"
license=('LGPL3')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ANSSI-FR/MLA/archive/mla-v$pkgver.tar.gz")
sha256sums=('b8f2a3b7595e491cf4f6d6e3886cd94af0a9a8b16f576dc901337fefaf048c8c')

build() {
  cd "MLA-mla-v$pkgver"
  cargo update
  cargo build --release --bin "$pkgname"
}

package() {
  cd "MLA-mla-v$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
