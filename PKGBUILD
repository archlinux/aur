# Maintainer: NeoTheFox <aur at repraptor.33mail.com>

pkgname=git-credential-keepassxc
pkgver=0.11.0
pkgrel=1
pkgdesc="git-credential-keepassxc is a Git credential helper that allows Git (and shell scripts) to get/store logins from/to KeePassXC"
url="https://github.com/Frederick888/git-credential-keepassxc"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('GPL3')
source=("https://github.com/Frederick888/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('285aaa55abcd8750a1c6503b8267bc36097c5fae4cd188e2497fd7d81c17f95b')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --target-dir target
}

package() {
  cd "$pkgname-$pkgver"
  install -Dt "$pkgdir"/usr/bin target/release/git-credential-keepassxc
}
