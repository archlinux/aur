# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Bambang Catur Pamungkas <bambangcaturz@gmail.com>

pkgname=sentry-cli
pkgver=1.52.3
pkgrel=1
pkgdesc="A command line utility to work with Sentry"
arch=('x86_64')
url="https://docs.sentry.io/cli/"
license=('BSD')
depends=('gcc-libs' 'zlib')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz"::https://github.com/getsentry/sentry-cli/archive/${pkgver}.tar.gz)
sha256sums=('9b1916d3a72bd6450230bba29871ac661e56ca5cb75e4ffd7ad33fd6a04d9d8f')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 target/release/sentry-cli "$pkgdir"/usr/bin/sentry-cli
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
