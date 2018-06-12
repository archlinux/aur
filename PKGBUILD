# Maintainer: Matthew Treinish <mtreinish@kortar.org>
pkgname=junitxml2subunit
pkgver=1.0.0
pkgrel=1
pkgdesc="A tool to covert JUnit XML to Subunit v2"
arch=('x86_64')
url="https://github.com/mtreinish/junitxml2subunit"
license=('GPL3')
makedepends=('cargo')
source=("https://github.com/mtreinish/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('71fef69ddbd0f0593bec7c08d2922a496604883d360b049cbe8ddc0fee27d1edf6543a2d90792506c06e6c5ffa75d4ecc29f90c9181a40410bbde8e0115935c2')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/junitxml2subunit" "$pkgdir/usr/bin/junitxml2subunit"
}

