# Maintainer: Carson Rueter <roachh@protonmail.com>
pkgname='cmdtools-git'
_pkgname='cmdtools'
pkgver=1.0.1.r4.g9a36144
pkgrel=1
pkgdesc="Tools to manipulate, create, and view commands."
arch=('any')
url="https://github.com/binex-dsk/cmdtools"
license=('GPL3')
source=("git+https://github.com/binex-dsk/cmdtools.git")
makedepends=('git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  git describe --tags | sed 's/-/.r/;s/-/./'
}

package() {
	cd $srcdir/$_pkgname/src
	for i in `find -type f`
		do install -Dm755 "$i" "$pkgdir/usr/bin/`basename $i`"
	done
}
