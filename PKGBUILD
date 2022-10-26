# Maintainer: Daniel Bodky <dbodky at gmail dot com>
pkgname=acorn-cli
pkgver="v0.3.1"
pkgrel=1
epoch=
pkgdesc="A simple application deployment framework for Kubernetes"
arch=("x86_64")
url="https://acorn.io/"
license=('Apache')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/acorn-io/acorn/releases/download/$pkgver/acorn-$pkgver-linux-amd64.tar.gz")
noextract=()
sha256sums=("462f0600b08cc300a6ee78723a186a4de1ffac554047c41aa769fa91967c65cd")
validpgpkeys=()

check() {
	cd "$srcdir"
	./acorn -v 
}

package() {
	cd "${srcdir}"
	install -Dm755 ./acorn -t "$pkgdir/usr/bin"
	./acorn completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/acorn"
	./acorn completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_acorn"
}
