# Maintainer: Matthew Treinish <mtreinish@kortar.org>
pkgname=junitxml2subunit
pkgver=1.0.1
pkgrel=1
pkgdesc="A tool to covert JUnit XML to Subunit v2"
arch=('x86_64')
url="https://github.com/mtreinish/junitxml2subunit"
license=('GPL3')
makedepends=('cargo')
source=("https://github.com/mtreinish/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('6c9d2953049df6be91408635e46d6475a3ca3f6b91b45e013cff26f400944dc49c999c14dad73d6a3c5bf782782e10b251eec9807ab1bb723aa62e180cca6f89')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/junitxml2subunit" "$pkgdir/usr/bin/junitxml2subunit"
}

