# Maintainer: Kobus van Schoor <pbscube at gmail dot com>
pkgname=dotgit
pkgver=1.2.3
pkgrel=1
pkgdesc="A comprehensive solution to managing your dotfiles"
url="http://github.com/Cube777/dotgit"
arch=('any')
depends=('git' 'sed' 'grep' 'bash')
source=('git+https://github.com/Cube777/dotgit.git')
md5sums=('SKIP')

prepare() {
	cd $pkgname
	git --work-tree . checkout -q tags/$pkgver
}

package() {
	install -Dm755 "$srcdir/$pkgname/dotgit" "$pkgdir/usr/bin/dotgit"
	install -Dm644 "$srcdir/$pkgname/bash_completion" "$pkgdir/usr/share/bash-completion/completions/dotgit"
}
