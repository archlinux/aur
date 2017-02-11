# Maintainer: PenguinSnail

pkgname=quick-back-git
pkgver=r142.7aadad6
pkgrel=1
pkgdesc="Quick, simple command line backup tool"
arch=('any')
url="https://github.com/PenguinSnail/Quick-Back"
license=('GPL3')
depends=('rsync' 'coreutils' 'util-linux' 'grep')
makedepends=('git')
provides=('quick-back-git')
source=('git://github.com/PenguinSnail/Quick-Back')
md5sums=('SKIP')

_gitname='Quick-Back'

pkgver() {
	cd $srcdir/$_gitname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -D -m 755 $srcdir/$_gitname/quick-back $pkgdir/usr/bin/quick-back
	install -D -m 644 $srcdir/$_gitname/MANPAGE $pkgdir/usr/share/man/man8/quick-back.8
	install -D -m 644 $srcdir/$_gitname/README.md $pkgdir/usr/share/doc/quick-back/README.md
	install -D -m 644 $srcdir/$_gitname/LICENSE $pkgdir/usr/share/doc/quick-back/LICENSE
}

