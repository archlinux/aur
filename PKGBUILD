# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="movie-rename-bin"
_pkgname="movie-rename"
pkgver=2.4.0
pkgrel=1
pkgdesc="A simple tool to rename movies, written in Rust."
arch=('x86_64')
url="https://github.com/SinTan1729/$_pkgname"
license=('GPL3')
provides=('movie-rename')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_pkgname.tar.gz")
b2sums=('b45f74b89ba4db8486f807189af459b36f188e942e32c1fb87068a598c02ecb66941288c7536d0a98d6b7e6e111f0a876e727bda4a1af43c04bbff70bcb22262')
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
