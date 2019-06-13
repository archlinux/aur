# Maintainer: alzeih <alzeih@users.noreply.github.com>

pkgname='pass-pwned-git'
pkgver=v0.1.0.r0.8e4a88b
pkgrel=1
pkgdesc="Password-Store extension for Have I Been Pwned? Pwned Passwords v2 API"
arch=('any')
url="https://github.com/alzeih/pass-pwned"
license=('MIT')
depends=('pass')
makedepends=('git')
source=('pass-pwned::git+https://github.com/alzeih/pass-pwned')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
