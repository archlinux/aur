# Maintainer: Taufik Hidayat <tfkhdyt@proton.me>
pkgname=axu
pkgver=1.3.0
pkgrel=3
epoch=
pkgdesc="A cli tool to check your Arch Linux explicitly installed packages updates"
arch=("x86_64")
url="https://github.com/tfkhdyt/axu"
license=('GPL3')
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/tfkhdyt/$pkgname/releases/download/v$pkgver-$pkgrel/$pkgname-v$pkgver-$pkgrel.tar.gz")
md5sums=("SKIP")

build() {
	./$pkgname completion bash > $pkgname.bash
	./$pkgname completion zsh > _$pkgname.zsh
	./$pkgname completion fish > $pkgname.fish
}

package() {
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 $pkgname.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm644 _$pkgname.zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
	install -Dm644 $pkgname.fish "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}