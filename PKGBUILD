# Maintainer: Taufik Hidayat <tfkhdyt@proton.me>
pkgname=axu-bin
pkgver=1.5.6
pkgrel=1
epoch=
pkgdesc="A cli tool to check your Arch Linux explicitly installed packages updates"
arch=("x86_64")
url="https://github.com/tfkhdyt/axu"
license=('GPL3')
depends=("pacman-contrib" "yay" "gawk")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=("axu")
source=("$pkgname-v$pkgver.tar.gz::https://github.com/tfkhdyt/axu/releases/download/v$pkgver/axu-v$pkgver.tar.gz")
md5sums=("SKIP")

build() {
	./axu completion bash >axu.bash
	./axu completion zsh >_axu.zsh
	./axu completion fish >axu.fish
}

package() {
	install -Dm755 axu "$pkgdir/usr/bin/axu"
	install -Dm644 axu.bash "$pkgdir/usr/share/bash-completion/completions/axu"
	install -Dm644 _axu.zsh "$pkgdir/usr/share/zsh/site-functions/_axu"
	install -Dm644 axu.fish "$pkgdir/usr/share/fish/vendor_completions.d/axu.fish"
}
