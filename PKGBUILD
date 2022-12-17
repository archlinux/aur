# Maintainer: aksr <aksr at t-com dot me>
pkgname=otf-euler-git
pkgver=r242.c2de386
pkgrel=1
pkgdesc="An OpenType/Unicode math port of AMS Euler font."
arch=('any')
url="https://github.com/khaledhosny/euler-otf"
license=('OFL')
makedepends=('git')
source=("$pkgname::git+https://github.com/khaledhosny/euler-otf.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm644 euler.otf $pkgdir/usr/share/fonts/OTF/euler.otf
	install -Dm644 OFL.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
