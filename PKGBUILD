# Maintainer: NeoTheFox <aur at repraptor.33mail.com>

pkgname=git-credential-keepassxc
pkgver=0.8.1
pkgrel=1
pkgdesc="git-credential-keepassxc is a Git credential helper that allows Git (and shell scripts) to get/store logins from/to KeePassXC"
url="https://github.com/Frederick888/git-credential-keepassxc"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('GPL3')
source=("https://github.com/Frederick888/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3fa4cbaf93d6fcfd68c9c0861ed8b81df2a009aef4599c6589820982def9322e')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dt "$pkgdir"/usr/bin target/release/git-credential-keepassxc
}
