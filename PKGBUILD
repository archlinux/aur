# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=xclipd
pkgver=1.0.0
pkgrel=2
pkgdesc='An X11 clipboard manager.'
url="https://github.com/jhunt/$pkgname"
arch=('x86_64')
license=('MIT')
makedepends=('git')
provides=('xclipd')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6dfa2226f2482f8e05ca0a1076a672944a2551d020c6871d1e4165e79aa6d151')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "xclipd" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

