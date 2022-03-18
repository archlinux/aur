# Maintainer: diced <pranaco2@gmail.com>
pkgname='fu'
pkgver=0.1.2
pkgrel=1
makedepends=('rust' 'cargo')
arch=('x86_64')
pkgdesc="Flameshot Uploader - Allows using SXCU files to upload images"
url="https://github.com/diced/flameshot-uploader"
source=('git+https://github.com/diced/flameshot-uploader.git#branch=trunk')
sha256sums=('SKIP')
license=('MIT')

build() {
  cd "$srcdir/flameshot-uploader" || exit 1

  cargo build --release
}

package() {
    cd "$srcdir/flameshot-uploader" || exit 1
    
    install -D -o root -g root -m 755 target/release/fu "$pkgdir/usr/bin/fu"
}

