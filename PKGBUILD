# Maintainer: René Wagner <rwagner at rw-net dot de>
pkgname=astro-git
pkgver=r84_9506566
pkgrel=1
pkgdesc="A Gemini web browser using shell script"
arch=('any')
url="https://github.com/blmayer/astro"
license=('MIT')
depends=('sed' 'less' 'openssl')
source=("${pkgname}_src::git+https://github.com/blmayer/astro.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}_src"
	printf "r%s_%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	mkdir -p "$pkgdir/usr/bin/"
	cd "$srcdir/${pkgname}_src"
	make PREFIX="$pkgdir/usr" install
}
