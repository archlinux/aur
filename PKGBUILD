# Maintainer: Canmi21 <9997200@qq.com>
# Contributor: Canmi(Canmi21)

pkgname=age
pkgver=1.0.0
pkgrel=1
pkgdesc="Check the installation time of your Arch Linux."
arch=('x86_64')
url="https://github.com/canmi21/age"
license=('MIT')
depends=('glibc' 'base')
makedepends=('cargo')

source=("git+https://github.com/canmi21/age.git#branch=master" 
        "https://raw.githubusercontent.com/canmi21/age/master/LICENSE")

sha256sums=('SKIP' 'SKIP')

prepare() {
  cd "$srcdir"
  mv age age-$pkgver
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/age "$pkgdir/usr/bin/age"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
