# Maintainer: eyelash <eyelash@users.noreply.github.com>

pkgname=xi-core-git
pkgver=r242.80445b9
pkgrel=1
pkgdesc='A modern editor with a backend written in Rust.'
arch=('i686' 'x86_64')
url='https://github.com/google/xi-editor'
license=('Apache')
makedepends=('git' 'cargo')
conflicts=('xi-core')
source=('git+https://github.com/google/xi-editor.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/xi-editor"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/xi-editor/rust"
	cargo install --root "$pkgdir/usr"
}
