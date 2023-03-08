
pkgname='lockbook'
_pkgname="lockbook"
pkgver=0.6.1
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/lockbook/lockbook"
pkgdesc="The private, polished note-taking platform."
license=('BSD-3-Clause')
makedepends=('rust' 'cargo' 'git')
provides=('lockbook')
conflicts=('lockbook')
source=("git+https://github.com/lockbook/lockbook.git#tag=$pkgver")
sha256sums=('SKIP')
groups=('lockbook')

pkgver() {
  cd $srcdir/lockbook/clients/cli
  echo "0.6.1"
}

build() {
  cd $srcdir/lockbook/clients/cli
  cargo build --release --locked
}

package_lockbook() {
  cd $srcdir/lockbook
  install -D -m755 "target/release/lockbook" "$pkgdir/usr/bin/lockbook"
}
