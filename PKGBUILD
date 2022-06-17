# Maintainer: NeoTheFox <aur at repraptor.33mail.com>

pkgname=git-credential-keepassxc
pkgver=0.10.0
pkgrel=1
pkgdesc="git-credential-keepassxc is a Git credential helper that allows Git (and shell scripts) to get/store logins from/to KeePassXC"
url="https://github.com/Frederick888/git-credential-keepassxc"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('GPL3')
source=("https://github.com/Frederick888/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('546d7c64ea7fe58dc119c6cd65f1d3a7bced682baac460de3cb66084961db99d')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dt "$pkgdir"/usr/bin target/release/git-credential-keepassxc
}
