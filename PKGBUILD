pkgname=songtext-git
pkgver=r7.0b4353b
pkgrel=1
pkgdesc="bash script for retrieving song lyrics."
arch=('any')
url="https://github.com/jonhoo/songtext"
license=('MIT')
groups=()
depends=('pup-git')
makedepends=('git')
source=('git+https://github.com/jonhoo/songtext.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 "songtext" "$pkgdir/usr/bin/songtext"
}
