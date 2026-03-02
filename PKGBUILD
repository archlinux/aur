# Maintainer: Aayush <me@a2ys.dev>
pkgname=turf-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Turf compiler"
arch=('x86_64')
url="https://github.com/turf-lang/turf-lang"
license=('MIT')
provides=('turf')
conflicts=('turf')
source=("https://github.com/turf-lang/turf-lang/releases/download/v${pkgver}/turf-v${pkgver}-linux-arch-x86_64.tar.gz")
sha256sums=('1579e9701706dc4c1c3f8a49300a00931eb1675c608445c755b64d3d1d234d2f')

package() {
	cd "$srcdir"
	install -Dm755 turf "$pkgdir/usr/bin/turf"
	if [ -d "scripts" ]; then
		install -Dm755 scripts/compile_and_run.sh "$pkgdir/usr/bin/turf-compile-and-run"
	fi
}

