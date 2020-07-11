# Maintainer: Dustin Testa <toast27@gmail.com>
# Developer: qorg11 <github.com/qorg11>

pkgname=lainsafecli
pkgver=0.4.r2.gc01d7cd # updated by pkgver()
pkgrel=1
pkgdesc="CLI interface for lainsafe"
arch=('any')
url='https://github.com/qorg11/lainsafe'
license=('GPL')
makedepends=('git')
depends=('perl' 'perl-lwp-protocol-https' 'perl-crypt-ssleay' 'perl-libwww')
md5sums=('SKIP')
provides=('lainsafecli')
source=("$pkgname::git+https://github.com/qorg11/lainsafe")

pkgver() {
	cd $pkgname
	git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

package() {
	cd $pkgname
	
	mkdir $pkgdir/usr/
	mkdir $pkgdir/usr/bin/
	
	install -D -m755 lainsafecli $pkgdir/usr/bin/lainsafecli
	install -D -m644 COPYING $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
