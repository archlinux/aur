# Maintainer: Aayush <me@a2ys.dev>
pkgname=turf-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Turf compiler"
arch=('x86_64')
url="https://github.com/turf-lang/turf-lang"
license=('MIT')
provides=('turf')
conflicts=('turf')
source=("https://github.com/turf-lang/turf-lang/releases/download/v${pkgver}/turf-v${pkgver}-linux-arch-x86_64.tar.gz")
sha256sums=('b3a5e14ff2ab9e5712c6a6c03f0cac289fd95944ae59fa89a4f399dbbe004607')

package() {
	cd "$srcdir"
	install -Dm755 turf "$pkgdir/usr/bin/turf"
	if [ -d "scripts" ]; then
		install -Dm755 scripts/compile_and_run.sh "$pkgdir/usr/bin/turf-compile-and-run"
	fi
}

