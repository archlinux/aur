# Maintainer: Brandon 'Inco' Little <drinco@posteo.net>
pkgname=ssg5
pkgver=1
pkgrel=2
pkgdesc='static site generator written on POSIX shell'

arch=('any')
license=('ISC')
depends=('cpio')

url=https://www.romanzolotarev.com
md5sums=('abf6c59327e7649a85cffaf95b904def')
source=($url/bin/ssg5)

build() {
	cd "$srcdir/$distdir"
	sed -n '/https:\/\/rgz.ee\/bin/,/OF THIS SOFTWARE./p' ssg5 | sed -e 's/# //' -e 's/#//' > LICENSE
}

package() {
	cd "$srcdir/$distdir"
	install -d "$pkgdir"/usr/bin/
	install -d "$pkgdir"/usr/share/licenses/$pkgname
	install -m755 ssg5    "$pkgdir"/usr/bin/ssg5
	install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
