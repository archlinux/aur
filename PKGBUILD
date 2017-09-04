# Maintainer: Andreas Louv <andreas@louv.dk>

pkgname=rpglectags-git
pkgver=1.7.1
pkgrel=1
pkgdesc="Create tags files from ILE RPG source files."
arch=("any")
url="https://github.com/andlrc/rpglectags"
license=("PerlArtistic")
depends=("perl>=5.16")
makedepends=("git")
provides=("rpglectags")
source=('rpglectags::git+git://github.com/andlrc/rpglectags#branch=master')
md5sums=("SKIP")

pkgver()
{
	cd "$srcdir/${pkgname%-git}"
	sed '/our \$VERSION.*'\''\(.*\)'\''.*/{s//\1/;q};d' rpglectags
}

package()
{
	cd "$srcdir/${pkgname%-git}"
	install -D rpglectags $pkgdir/usr/bin/rpglectags
	install -Dm644 rpglectags.1 $pkgdir/usr/share/man/man1/rpglectags.1
}
