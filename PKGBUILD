pkgname=cisco-global-exploiter
pkgver=13
pkgrel=1

pkgdesc='This tool detects 14 different vulnerabilities on Cisco routers and switches'
url='http://www.blackangels.it'
arch=('any')
license=('GPL')
depends=('perl')
makedepends=('git')

source=(${pkgname}::git+https://github.com/foreni-packages/cisco-global-exploiter)
sha512sums=('SKIP')

package() {
    install -Dm755 -t "$pkgdir/usr/bin" "$pkgname/cge.pl"
	install -Dm644 -t "$pkgdir/usr/share/licenses/cisco-global-exploiter/" "$pkgname/debian/copyright"
	mkdir -p $pkgdir/usr/share/doc/cisco-global-exploiter
	cp -r $pkgname/debian $pkgname/doc $pkgdir/usr/share/doc/cisco-global-exploiter/
}
