# Maintainer: jaiden brooke <jaiden.lily.brooke@gmail.com>
pkgname=dolltool
pkgver=1.4.0
pkgrel=1
pkgdesc="A simple dollcode encoder, decoder, and generator inside your terminal"
url=https://git.gay/ika4422/dolltool
arch=('x86_64' 'aarch64')
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://git.gay/ika4422/dolltool/archive/v$pkgver.tar.gz")
sha256sums=('d536e6b3d93ce85cc48780565f1ac461a424bf0deff64fc95d474af5bdee29ec')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 "target/release/dolltool" "$pkgdir/usr/bin/dolltool"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
