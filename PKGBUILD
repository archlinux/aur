# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=grainbow-git
pkgver=r2.cff35ea
pkgrel=3
pkgdesc="Color the screen with a rainbow (libgamma version)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/dariost/GRainbow"
license=('APACHE2')
depends=('libgammamm')
options=()
source=("git+https://github.com/dariost/GRainbow.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/GRainbow"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/GRainbow"
    make
}

package() {
    cd "$srcdir/GRainbow"
    install -Dm755 grainbow "$pkgdir/usr/bin/grainbow"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/grainbow/LICENSE"
}
