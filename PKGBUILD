# Maintainer: yuioto <yuiotochan@outlook.com>

pkgname=fav-bin
_pkgname=fav
pkgver=0.1.10
pkgrel=1
pkgdesc='Back up your favorite bilibili resources with CLI'
arch=('x86_64')
url="https://github.com/kingwingfly/${_pkgname}"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("${_pkgname}-${pkgver}.tar.gz::$url/releases/download/v$pkgver/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('f640efc99a3f4c9778fe4ac724b0e91602536ac322272e05074b95922040a212')

package() {
	install -Dm755 ${_pkgname} "$pkgdir"/usr/bin/${_pkgname}

	# completions
	${_pkgname} completion bash > ${_pkgname}.bash
	${_pkgname} completion fish > ${_pkgname}.fish
	${_pkgname} completion zsh > _${_pkgname}
	install -Dm644 ${_pkgname}.bash "$pkgdir"/usr/share/bash-completion/completions/${_pkgname}
	install -Dm644 ${_pkgname}.fish "$pkgdir"/usr/share/fish/vendor_completions.d/${_pkgname}.fish
	install -Dm644 _${_pkgname} "$pkgdir"/usr/share/zsh/site-functions/_${_pkgname}
}
