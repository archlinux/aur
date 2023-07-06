# Maintainer: freehelpdesk <freehelpdesk@proton.me>

pkgname=parceli-git
pkgver=0.1.0
pkgrel=1
pkgdesc='CLI implementation of a package/mail tracker for USPS/UPS/FedEx made in Rust using the parcel library and a bit of smarts.'
arch=('x86_64')
url="https://github.com/freehelpdesk/parceli"
license=('BSD3')
makedepends=(rust rust-src git pkg-config)
source=("git+$url")
sha256sums=('SKIP')

pkgvar() {
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare(){
  cd "parceli"
}

build() {
  cd "parceli"
  cargo build --release
}

package() {
  cd "parceli"
  install -Dm755 target/release/parceli "$pkgdir"/usr/bin/parceli
}
