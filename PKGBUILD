# Maintainer: alzeih <alzeih@users.noreply.github.com>

pkgname='pass-pwned-git'
pkgver=r11.884856e
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
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
