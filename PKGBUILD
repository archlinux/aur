# Maintainer: Kedap <kedap.dev at protonmail dot com>

pkgname=sensei-git
_pkgname=sensei
pkgver=1.2.8.151.94aeae1
pkgrel=2
pkgdesc="Sensei is a simple command line tool to open documentation for any crate in crates.io."
arch=('i686' 'x86_64') # Delimited for cargo/rustc
url="https://github.com/edfloreshz/sensei"
license=('GPL2')
depends=()
makedepends=('cargo' 'git')
provides=('sns')
conflicts=('sensei' 'sns')
source=("sensei::git+https://github.com/edfloreshz/sensei.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	echo "1.2.8.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	cargo build --release --locked
}

package() {
  cd "$_pkgname"
  install -Dm755 target/release/sns "$pkgdir"/usr/bin/sns
}
