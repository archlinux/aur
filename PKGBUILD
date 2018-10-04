# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=makeppkg
_pkgname=makeppkg
pkgver=1.1.0
pkgrel=1
makedepends=('rust' 'cargo' 'gcc-libs')
arch=('i686' 'x86_64')
pkgdesc="wrapper for Arch Linux's makepkg, patches source before packages are built"
url="https://github.com/ibrokemypie/makeppkg"
license=('Apache-2.0')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_pkgname/$pkgver/download")
sha256sums=('61518d1eb49edf3323d0f3aad931b4d81db70e6d7fc333ee260e1df0bb8108a9')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"
}
