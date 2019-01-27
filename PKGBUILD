# Maintainer: Odel <odelvidyascape@gmail.com>
# Contributor: Alessandro Schillaci < http://slade.altervista.org >
pkgname=inform
pkgver=6.34
_ilibver=6.12.2
pkgrel=1
pkgdesc="Interactive fiction compiler"
arch=(i686 x86_64)
url="http://www.inform-fiction.org/"
license=('custom:"freeware"')
depends=('glibc')
groups=(inform)
source=(http://www.ifarchive.org/if-archive/infocom/compilers/inform6/source/$pkgname-$pkgver-$_ilibver.tar.gz)

md5sums=('c5ef293adb9d245975ca5aa3af2bdef8')

build(){
	cd $srcdir/$pkgname-$pkgver-$_ilibver
	make PREFIX=/usr MAN_PREFIX=/usr/share
}

package() {
	cd $srcdir/$pkgname-$pkgver-$_ilibver
	make PREFIX="${pkgdir}"/usr MAN_PREFIX="${pkgdir}"/usr/share install
}
