# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=p4merge-bin
pkgver=24.2
pkgrel=1
pkgdesc='Perforce three-way merging and side-by-side file comparison tool'
arch=('x86_64')
url='https://www.perforce.com/products/helix-core-apps/merge-diff-tool-p4merge'
license=('custom')
provides=("p4merge=${pkgver}")
conflicts=('p4merge')
source=("https://www.perforce.com/downloads/perforce/r$pkgver/bin.linux26x86_64/p4v.tgz"
        "p4admin.desktop"
        "p4merge.desktop")
sha256sums=('67cf025655c503ffb63575ca8f4b502e509fce1fc52e9d942640b81c38791845'
            'SKIP'
            'SKIP')

package() {
	mkdir -p "$pkgdir/opt"
	cp -r p4v-* "$pkgdir/opt/p4merge"

	mkdir -p "$pkgdir/usr/bin"
	ln -s /opt/p4merge/bin/p4admin "$pkgdir/usr/bin/p4admin"
	ln -s /opt/p4merge/bin/p4merge "$pkgdir/usr/bin/p4merge"

	mkdir -p "$pkgdir/usr/share/applications"
	cp p4admin.desktop p4merge.desktop "$pkgdir/usr/share/applications/"
}
