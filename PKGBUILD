#maintainer lxgr <lxgr@protonmail.com>
pkgname=buildaur
pkgver=1
pkgrel=1
pkgdesc="A AUR helper"
arch=(any)
url="https://github.com/lxgr-linux/gitaur"
license=('GPL v3')
depends=()
makedepends=('git')

source=("$pkgname"::'git://github.com/lxgr-linux/gitaur.git')
md5sums=('SKIP')

pkgver() {
	    cd "$pkgname"
	        echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare(){
	cd "$srcdir/$pkgname"
	chmod +x sysinfo
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin" "gitaur"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
