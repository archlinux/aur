# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=makeppkg
_pkgname=makeppkg
pkgver=1.1.1
pkgrel=1
makedepends=('rust' 'cargo' 'gcc-libs')
arch=('i686' 'x86_64')
pkgdesc="wrapper for Arch Linux's makepkg, patches source before packages are built"
url="https://github.com/ibrokemypie/makeppkg"
license=('Apache-2.0')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_pkgname/$pkgver/download")
sha256sums=('d321622c669dde2e96cadfef81eed36343c0468699a102ca242a4a83423c11e6')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"
}
