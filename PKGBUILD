# Contributor: Dirk Sohler <spam@0x7be.de>               
# Maintainer: Dirk Sohler <spam@0x7be.de>
# vim: ts=4:sw=4

pkgname=obrowse-git
_gitname=obrowse
pkgver=3.1.3
pkgrel=2
pkgdesc='Openbox pipemenu file browser with icons and various filtering options.'

url='http://dev.0x7be.de/obrowse.html'
arch=('any')
license=('GPL')

depends=('python>=3.0')
makedepends=('git')

install=obrowse.install

branch='master'
source=("git://github.com/dsohler/obrowse.git#branch=$branch"
		'obrowse.install')
sha256sums=('SKIP'
			'8296d5579f15b30ae5d6ed30bf2d6aca2bca1c52c6b8b6020cafc8775408cda3')

pkgver() {
	cd "$srcdir/$_gitname"
	echo $(sed -n "s/^progversion = '\(.*\)'/\1/p" obrowse.py)
}

package() {
	cd "$srcdir/$_gitname"
	install -Dm 755 obrowse.py $pkgdir/usr/bin/obrowse
	install -Dm 644 example-config.cfg \
		$pkgdir/usr/share/doc/obrowse/example-config.cfg
}
