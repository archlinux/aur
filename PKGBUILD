# Maintainer: Canmi21 <9997200@qq.com>
# Contributor: Canmi(Canmi21)

pkgname=system-age
pkgver=1.0.1
pkgrel=2
pkgdesc="Check the installation time of your Arch Linux."
arch=('x86_64')
url="https://github.com/canmi21/age"
license=('MIT')
depends=('glibc')
makedepends=('cargo')

source=("git+https://github.com/canmi21/age.git#branch=master" 
        "https://raw.githubusercontent.com/canmi21/age/master/LICENSE")

sha256sums=('SKIP' 'SKIP')

prepare() {
  cd "$srcdir"
  mv age age-$pkgver
}

build() {
  cd "$srcdir/age-$pkgver" 
  cargo build --release
}

package() {
  cd "$srcdir/age-$pkgver" 
  install -Dm755 target/release/age "$pkgdir/usr/bin/age"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
