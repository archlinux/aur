# Maintainer : Daniel Chesters <daniel.chesters@gmail.com>
# Contributor : Daniel Chesters <daniel.chesters@gmail.com>

pkgname=kalker
pkgver=1.0.1
_specialrel=2
pkgrel=1
pkgdesc="A calculator program that supports user-defined variables, functions, derivation, and integration."
url="https://github.com/PaddiM8/kalker"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
#source=("$pkgname-$pkgver.tar.gz::https://github.com/PaddiM8/$pkgname/archive/v$pkgver.tar.gz")
# For this release, I have to use a non standard version since upstream has to fix Cargo.lock file
source=("$pkgname-$pkgver.tar.gz::https://github.com/PaddiM8/$pkgname/archive/v$pkgver-$_specialrel.tar.gz")

build() {
#  cd "$pkgname-$pkgver"
  cd "$pkgname-$pkgver-$_specialrel"
  cargo build --release
}

package() {
#  cd "$pkgname-$pkgver"
  cd "$pkgname-$pkgver-$_specialrel"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
b2sums=('c1aef5709551351d2c821e56633db472e75e02022b7f2d4444948848204381b93bc06c75324dcde571bc9dec05449c7c3b329ae83ba6e99642f260238eaece0c')
