# Maintainer: Kedap <kedap.dev at protonmail dot com>
pkgname=sensei-git
_pkgname=sensei
pkgver=0.2.7.101.b42d3b5
pkgrel=1
pkgdesc="Sensei is a simple command line tool to open documentation for any crate in crates.io."
arch=('i686' 'x86_64') # Delimited for cargo/rustc
url="https://github.com/edfloreshz/sensei"
license=('GPL2')
depends=()
makedepends=('cargo' 'git')
provides=('sensei')
conflicts=('sensei')
provides=('sensei')
conflicts=('sensei')
source=("sensei::git+https://github.com/edfloreshz/sensei.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	echo "0.2.7.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	cargo build --release --locked
}

package() {
  cd "$_pkgname"
  install -Dm755 target/release/sensei "$pkgdir"/usr/bin/sensei
}
