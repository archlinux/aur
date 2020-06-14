#maintainer lxgr <lxgr@protonmail.com>
pkgname=buildaur
pkgver=8.0c259dd
pkgrel=1
pkgdesc="A AUR helper"
arch=(any)
url="https://github.com/lxgr-linux/gitaur"
license=('GPL v3')
depends=()
makedepends=('git')

source=("$pkgname"::'git://github.com/lxgr-linux/buildaur.git')
md5sums=('SKIP')

pkgver() {
	    cd "$pkgname"
	        echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare(){
	cd "$srcdir/$pkgname"
}

package() {
	cd "$srcdir/$pkgname"
	install -dm755 "${pkgdir}/usr/share/buildaur"
	install -D -m644 blacklist "${pkgdir}/usr/share/buildaur"
	install -Dm0755 -t "$pkgdir/usr/bin" "buildaur"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
