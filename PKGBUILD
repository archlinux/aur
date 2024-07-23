# Maintainer: Astro <astroncityStatic@gmail.com>
pkgname='cosmic-ascent'
pkgver=v1.0.0.r2.g70e67c4
pkgrel=1
pkgdesc="A 2D top-down rogue-like currently in development"
arch=('x86_64')
url="https://github.com/Astroncity/Cosmic-Ascent"
license=('MIT')
depends=('glibc' 'raylib')
makedepends=('git')
source=("$pkgname::git+https://github.com/Astroncity/Cosmic-Ascent.git")
md5sums=('SKIP')

pkgver(){
	cd "$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	install -Dm755 ./bin/cosmic-ascent "$pkgdir/usr/bin/cosmic-ascent"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/cosmic-ascent/README.md"
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/cosmic-ascent/LICENSE"
}
