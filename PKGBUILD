# Maintainer: yuioto <yuiotochan@outlook.com>

pkgname=fav-bin
_pkgname=fav
pkgver=0.1.11
pkgrel=2
pkgdesc='Back up your favorite bilibili resources with CLI'
arch=('x86_64')
url="https://github.com/kingwingfly/${_pkgname}"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("${_pkgname}-${pkgver}.tar.gz::$url/releases/download/v$pkgver/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('c7e1660ea9e7d1d7c2cc1caaf969c44b29a26ad14b78c33f6f2f4209ba22e243')

package() {
	install -Dm755 ${_pkgname} "$pkgdir"/usr/bin/${_pkgname}

	# completions
	./${_pkgname} completion bash > ${_pkgname}.bash
	./${_pkgname} completion fish > ${_pkgname}.fish
	./${_pkgname} completion zsh > _${_pkgname}
	install -Dm644 ${_pkgname}.bash "$pkgdir"/usr/share/bash-completion/completions/${_pkgname}
	install -Dm644 ${_pkgname}.fish "$pkgdir"/usr/share/fish/vendor_completions.d/${_pkgname}.fish
	install -Dm644 _${_pkgname} "$pkgdir"/usr/share/zsh/site-functions/_${_pkgname}
}
