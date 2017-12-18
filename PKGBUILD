# Maintainer: Kobus van Schoor <v dot schoor dot kobus at gmail dot com>
pkgname=dotgit
pkgver=1.4.4
pkgrel=1
pkgdesc="A comprehensive solution to managing your dotfiles"
url="http://github.com/kobus-v-schoor/dotgit"
arch=('any')
depends=('git' 'bash' 'gnupg')
source=('git+https://github.com/kobus-v-schoor/dotgit.git')
md5sums=('SKIP')

prepare()
{
	cd $pkgname
	git --work-tree . checkout -q tags/$pkgver
}

package()
{
	install -Dm 755 "$srcdir/dotgit/bin/dotgit" "$pkgdir/usr/bin/dotgit"
	cp -r "$srcdir/dotgit/bin/dotgit_headers" "$pkgdir/usr/bin/dotgit_headers"
	chmod 555 "$pkgdir/usr/bin/dotgit_headers"
	install -Dm644 "$srcdir/dotgit/bin/bash_completion" \
		"$pkgdir/usr/share/bash-completion/completions/dotgit"
}
