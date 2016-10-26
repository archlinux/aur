# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=xrainbow-git
pkgver=r5.4f1743c
pkgrel=2
pkgdesc="Color the screen with a rainbow (X11 version)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/dariost/XRainbow"
license=('APACHE2')
depends=('libx11' 'libxxf86vm')
options=()
source=("git+https://github.com/dariost/XRainbow.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/XRainbow"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/XRainbow"
    make
}

package() {
    cd "$srcdir/XRainbow"
    install -Dm755 xrainbow "$pkgdir/usr/bin/xrainbow"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xrainbow/LICENSE"
}
