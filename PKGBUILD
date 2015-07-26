# Maintainer: Midov <midov@midov.pl>
pkgname=bashets
pkgver=0.6.3
pkgrel=3
pkgdesc='User shellscript-powered library for Awesome WM, for widgets and something else'
url='http://gitorious.org/bashets'
license=('GPL')
arch=('any')
depends=('awesome')
#source=('http://gitorious.org/bashets/bashets/blobs/raw/master/bashets.lua')
#md5sums=('116fd5a205030b6d4a10e99b80683cab')

_mygitroot=git://github.com/Midek/bashets
_mygitname=bashets

build() {
	cd "$srcdir"

	msg "Connecting to $_mygitroot..."
	if [[ -d $_mygitname ]]; then
		cd $_mygitname && git pull origin && cd ..
		msg2 "updated"
	else
		git clone $_mygitroot
		msg2 "checkout done"
	fi
}
package(){
	install -Dm644 ${srcdir}/bashets/bashets.lua ${pkgdir}/usr/share/awesome/lib/bashets.lua
	mkdir -p ${pkgdir}/usr/share/awesome/bashets/
	install -Dm755 ${srcdir}/bashets/userscripts/* ${pkgdir}/usr/share/awesome/bashets/
}
