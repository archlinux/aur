# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=ab-av1
pkgver=0.1.0
pkgrel=1
pkgdesc="AV1 encoding tool with fast VMAF sampling."
arch=('x86_64')
url="https://github.com/alexheretic/ab-av1"
license=('Apache-2.0')
depends=('svt-av1'
         'ffmpeg'
         'vmaf'
         'opus')
optdepends=()
makedepends=('rust'
             'git')
source=("https://github.com/alexheretic/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('584657e24b3bf13a71fbea33d06d08e05322c0281a6a145947759df9c5bbbcba')

build() {
  cd "$pkgname-$pkgver"
  cargo +stable build --release --locked --target-dir=target
}

package() {
  install -Dm 755 "$pkgname-$pkgver"/target/release/ab-av1 -t "$pkgdir/usr/bin"
}
