pkgname=headlines-tui-git
pkgver=0.2.3
pkgrel=5
pkgdesc="Interactively view the latest news in your terminal with Rust"
arch=(x86_64)
url="https://gitlab.com/pluskale/headlines"
license=('MIT')
makedepends=(git rustup)
optdepends=()
provides=(headlines)
conflicts=(headlines)
backup=()
options=()
source=("git+$url")
sha256sums=('SKIP')

build() {
        cd "headlines"
	cargo build --release
}

package() {
        cd "headlines/target/release"
        install -Dm755 headlines "$pkgdir/usr/bin/headlines"
}
