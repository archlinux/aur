# Contributor: Dirk Sohler <spam@0x7be.de>               
# Maintainer: Dirk Sohler <spam@0x7be.de>
# vim: ts=4:sw=4

pkgname=mkpassword-git
_gitname=mkpassword
pkgver=2.0.1
pkgrel=2
pkgdesc='A simple secure password generator.'

url='http://dev.0x7be.de/mkpassword.html'
arch=('any')
license=('GPL')

depends=('python>=3.0')
makedepends=('git')

branch='master'
source=("git://github.com/dsohler/mkpassword.git#branch=$branch")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	echo $(sed -n "s/^progversion='\(.*\)'/\1/p" mkpassword.py)
}

package() {
	cd "$srcdir/$_gitname"
	install -Dm 755 mkpassword.py $pkgdir/usr/bin/mkpassword
}
