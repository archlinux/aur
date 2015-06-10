# Maintainer: Buce <dmbuce@gmail.com>
# Contributor: Duncan Bain <duncanjbain@gmail.com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=minecraft-overviewer-git
pkgver=0.11.0.10.gcbd76d8
pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags --match 'v*.*.*' | sed 's/^v//; s/-/./g'
}
pkgrel=1
pkgdesc="Render large resolution images of a Minecraft map with a Google Maps powered interface"
arch=('x86_64' 'i686')
url="https://github.com/overviewer/Minecraft-Overviewer"
license=('GPL')
depends=('python2' 'python-imaging' 'python2-numpy')
makedepends=('git')
conflicts=('minecraft-overviewer')
provides=('minecraft-overviewer')
source=("$pkgname::git://github.com/overviewer/Minecraft-Overviewer.git")
md5sums=(SKIP)

build() {
	cd "$srcdir/$pkgname"
	python2 "setup.py" build
}

package() {
	cd "$srcdir/$pkgname"
	python2 "setup.py" install --prefix="$pkgdir/usr"
} 
