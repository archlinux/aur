# Maintainer: Chrysostomus @forum.manjaro.org
# Developer: pheiduck @forum.manjaro.org

pkgname=manjaro-zsh-config-git
_pkgname=manjaro-zsh-config
pkgver=0.20
pkgrel=1
pkgdesc="Zsh configuration for manjaro"
arch=(any)
url="https://github.com/Chrysostomus/$_pkgname"
_gitcommit=22e8f42e90470f7ac8ec1b322b5f7b979272d85f
license=('MIT')
conflicts=('grml-zsh-config')
depends=('zsh-autosuggestions'
	'zsh-syntax-highlighting'
	'zsh-completions'
	'zsh-history-substring-search'
	'zsh'
	'pkgfile'
	'nerd-fonts-noto-sans-mono'
	'zsh-theme-powerlevel10k')
source=("$_pkgname.tar.gz::$url/archive/$_gitcommit.tar.gz")
sha256sums=('ebfce2d188227c0425d5a0cf58b9ea530964fb09f4f959187a08a142b36d26d8')
backup=(root/.zshrc)

package() {
	cd ${srcdir}
	install -D -m644 $srcdir/$_pkgname-$_gitcommit/.zshrc ${pkgdir}/etc/skel/.zshrc
	install -D -m644 $srcdir/$_pkgname-$_gitcommit/manjaro-zsh-config ${pkgdir}/usr/share/zsh/manjaro-zsh-config
	install -D -m644 $srcdir/$_pkgname-$_gitcommit/manjaro-zsh-prompt ${pkgdir}/usr/share/zsh/manjaro-zsh-prompt
	install -D -m644 $srcdir/$_pkgname-$_gitcommit/zsh-maia-prompt ${pkgdir}/usr/share/zsh/zsh-maia-prompt
	install -D -m644 $srcdir/$_pkgname-$_gitcommit/p10k.zsh ${pkgdir}/usr/share/zsh/p10k.zsh
	install -D -m644 $srcdir/$_pkgname-$_gitcommit/command-not-found.zsh ${pkgdir}/usr/share/zsh/functions/command-not-found.zsh
	install -D -m640 $srcdir/$_pkgname-$_gitcommit/rootzshrc ${pkgdir}/root/.zshrc
	chmod 750 ${pkgdir}/root
	mkdir -p $pkgdir/usr/share/zsh/scripts
	cp -r $srcdir/$_pkgname-$_gitcommit/base16-shell $pkgdir/usr/share/zsh/scripts
	chmod a+x $pkgdir/usr/share/zsh/scripts/base16-shell/*
}

