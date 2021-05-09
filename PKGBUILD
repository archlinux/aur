# Maintainer: Muhammad Mohsin <sheikhmohsin706@gmail.com>
pkgname=rufetch
_name=RuFetch
_binname=rufetch
pkgver=0.2.2
pkgrel=1
epoch=
pkgdesc="RuFetch is a customisable system info fetch written in Rust for Windows, Linux and Mac."
arch=('any')
url="https://github.com/SupremeDeity/RuFetch"
license=('GPL3')
makedepends=('git' 'rust' 'cargo')
source=("git+https://github.com/SupremeDeity/RuFetch")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$_name" || exit 1
	# Build a release build
  cargo build --release
}

package() {
	cd "$srcdir/$_name" || exit 1

  # Install binary
  install -D -o root -g root -m 755 target/release/ru_fetch "$pkgdir/usr/bin/${_binname}"

  # Install GPL3 license
  # install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # print command executable name
  printf "The executable is named: %s\n" "${_binname}"
}
