# Maintainer: Kilian Guillaume "cafehaine" <kilian dot guillaume at gmail dot com>
pkgname=almond
pkgrel=3
pkgver=0.8.1
pkgdesc="A scala kernel for Jupyter"
arch=('x86_64')
url="https://almond.sh/"
license=('BSD')
depends=('jupyter' 'scala')
makedepends=()
source=("https://github.com/almond-sh/almond/releases/download/v0.8.1/almond" "kernel.json")
md5sums=('SKIP' 'SKIP')

package() {
	cd "$srcdir"
	chmod +x ../almond
	COURSIER_CACHE=$(pwd)/.coursier-cache ./almond --install --jupyter-path "$pkgdir/usr/share/jupyter/kernels/"
	install -Dm644 kernel.json -t "$pkgdir/usr/share/jupyter/kernels/scala/"
}

