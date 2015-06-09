# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=repo
pkgname=$_pkgname-git
pkgver=v1.12.22.17.g185307d
pkgrel=1
pkgdesc="Tool built on top of git to help manage many git repositories. Part of the Android project."
arch=("any")
url="https://source.android.com/source/developing.html"
license=("APACHE")
depends=("git" "python2")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://gerrit.googlesource.com/git-repo")
sha256sums=("SKIP")


pkgver() {
	cd "$srcdir/$_pkgname"
	echo $(git describe --always | sed "s/-/./g")
}

package() {
	cd "$srcdir/$_pkgname"
	install -D -m 755 repo "$pkgdir/usr/bin/repo"
	install -D -m 644 docs/manifest-format.txt "$pkgdir/usr/share/doc/repo/manifest-format.txt"
}
