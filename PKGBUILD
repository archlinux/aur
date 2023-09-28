# Maintainer: Severin Leonhardt <serviushack at gmx dot de>
pkgname=hypernate
pkgver=1.1.0
pkgrel=1
pkgdesc='Get more out of hibernation'
url='https://gitlab.com/serviushack/hypernate'
license=('ISC')
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("git+https://gitlab.com/serviushack/hypernate.git#tag=$pkgver")
md5sums=('SKIP')

package() {
  cargo install --root="$pkgdir/usr" --path=hypernate hypernate

  # cargo install creates .crates.toml, see https://github.com/rust-lang/cargo/issues/3316
  rm $pkgdir/usr/.crates.toml
}
