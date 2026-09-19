# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="movie-rename-bin"
_pkgname="movie-rename"
pkgver=2.4.1
pkgrel=1
pkgdesc="A simple tool to rename movies, written in Rust."
arch=('x86_64')
url="https://github.com/SinTan1729/$_pkgname"
license=('GPL3')
provides=('movie-rename')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_pkgname.tar.gz")
b2sums=('a28ed57c118b79904576b155123bdceb5c94090c6042fd5a6d76edacbca90020352e6b69079a6a8bc4bcf20c4f29606d6c419e33c4161cc976ee7e7adc2e3047')
package() {
	# binary
	install -Dm755 ./$_pkgname "$pkgdir/usr/bin/$_pkgname"
	# manpage
	install -Dm644 ./$_pkgname.1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
	# completions
	if $(command -v fish &>/dev/null); then
		install -Dm644 ./$_pkgname.fish "${pkgdir}/usr/share/fish/completions/$_pkgname.fish"
	fi
	if $(command -v bash &>/dev/null); then
		install -Dm644 ./$_pkgname.bash "${pkgdir}/usr/share/bash-completion/completions/$_pkgname"
	fi
	if $(command -v zsh &>/dev/null); then
		install -Dm644 ./$_pkgname.zsh "${pkgdir}/usr/share/zsh/site-functions/_$_pkgname"
	fi
}
