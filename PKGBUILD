# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=miniserve
pkgver=0.2.2
pkgrel=1
pkgdesc="Tool to serve files via HTTP"
arch=('x86_64')
url="https://github.com/svenstaro/miniserve"
license=(MIT)
makedepends=(cargo)
source=(https://github.com/svenstaro/miniserve/archive/v${pkgver}.tar.gz)
sha512sums=('d77eb518c231bc1720add86bfda8bafe85a9ed8497a5613d3186aaf78b4a99f7ab7fce872d9990cb47b24126b13bcec4f3d30201e913f3865847227256badf5b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/miniserve "$pkgdir"/usr/bin/miniserve
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
