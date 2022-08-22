# Maintainer: Stefan Melmuk <stefan.melmuk@gmail.com>

pkgname=crowbook
pkgver=0.15.2e
pkgrel=2
pkgdesc="Converts books written in Markdown to HTML, LaTeX/PDF and EPUB"
arch=('x86_64')
url="https://github.com/lise-henry/crowbook"
license=('LGPL')
makedepends=('rust')
optdepends=('texlive-latexextra: create PDF')
source=("git+https://github.com/lise-henry/crowbook.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
        cargo build --release --locked --target-dir=target
}

check() {
	cd "$srcdir/$pkgname"
        cargo test --release --locked --target-dir=target
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
