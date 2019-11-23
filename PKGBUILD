# Maintainer: Antoine Viallon <antoine.viallon@gmail.com>

pkgname=phppgadmin-relhasoids
_pkgname=${pkgname%-relhasoids}
pkgver=7.12.1
pkgrel=1
pkgdesc="The premier web-based administration tool for postgresql"
arch=('i686' 'x86_64')
url="https://github.com/xzilla/phppgadmin/tree/relhasoids"
license=('GPLv2')
#depends=('')
makedepends=('git')
conflicts=('phppgadmin')
provides=('phppgadmin')
source=(git+https://github.com/xzilla/phppgadmin#branch=relhasoids)
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
	cat HISTORY | grep "Version" | head -n 1 | cut -d " " -f 2
	#git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
	#printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
#	shopt -s glob
	mkdir -p $pkgdir/usr/share/webapps/phppgadmin/
	cp -Rv $srcdir/$_pkgname/* $pkgdir/usr/share/webapps/phppgadmin/
	chown -R http:http $pkgdir/usr/share/webapps/phppgadmin/
	chmod -R 644 $pkgdir/usr/share/webapps/phppgadmin/
}
