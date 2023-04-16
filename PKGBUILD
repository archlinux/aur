# Maintainer: Gregor Boehl <admin@gregorboehl.com>

pkgname=manjaro-zsh-config
pkgver=0.25
pkgrel=3
pkgdesc="Zsh configuration for manjaro"
arch=('any')
url="https://github.com/Chrysostomus/manjaro-zsh-config"
license=('MIT')
depends=('zsh-autosuggestions'
	'zsh-syntax-highlighting'
	'zsh-completions'
	'zsh-history-substring-search'
	'zsh'
	'pkgfile'
	'ttf-noto-nerd'
	'zsh-theme-powerlevel10k')
makedepends=('git')
install="$pkgname.install"
_commit=a09dbc3f6bf22d553def64247b3529d9310c7b1f
source=("git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

package() {
	cd "$srcdir/$pkgname"
	install -D -m644 "$pkgname" -t "${pkgdir}/usr/share/zsh/"
	install -D -m644 manjaro-zsh-prompt -t "${pkgdir}/usr/share/zsh"
	install -D -m644 zsh-maia-prompt -t "${pkgdir}/usr/share/zsh/"
	install -D -m644 p10k.zsh -t "${pkgdir}/usr/share/zsh/"
	install -D -m644 p10k-portable.zsh -t "${pkgdir}/usr/share/zsh/"
	install -D -m644 command-not-found.zsh -t "${pkgdir}/usr/share/zsh/functions/"
	install -D -m640 .zshrc -t "${pkgdir}/etc/zsh/zshrc-manjaro"
	install -d "${pkgdir}/usr/share/zsh/scripts"
	cp -r base16-shell "${pkgdir}/usr/share/zsh/scripts/"
	chmod a+x "${pkgdir}/usr/share/zsh/scripts/base16-shell/"*
	install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname/"

}
