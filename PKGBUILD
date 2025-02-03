# Maintainer: NeoTheFox <aur at repraptor.33mail.com>

pkgname=git-credential-keepassxc
pkgver=0.14.1
pkgrel=1
pkgdesc="git-credential-keepassxc is a Git credential helper that allows Git (and shell scripts) to get/store logins from/to KeePassXC"
url="https://github.com/Frederick888/git-credential-keepassxc"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('GPL3')
source=("https://github.com/Frederick888/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('597a346cc660978827a48b06b7137957b4aa4f7f3784ffa76f1c1a13ff9f7368')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --features all --locked --target-dir target
}

package() {
  cd "$pkgname-$pkgver"
  install -Dt "$pkgdir"/usr/bin target/release/git-credential-keepassxc
}
