# Maintainer: ayrton @linux.com
# Developer: pheiduck @forum.manjaro.org

pkgname=manjaro-zsh-config-git
_pkgname=manjaro-zsh-config
pkgver=0.20.1
pkgrel=1
pkgdesc="Zsh configuration from manjaro forked for archlinux"
arch=(any)
url="https://github.com/ayr-ton/$_pkgname"
_gitcommit=a9b56f606ec86deec893ed67f5941652bc8c2b6d
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
sha256sums=('b0bf0006867878e3e4778cdeed40269242cf962ddd27ee98d0a40233a35e82d5')
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

