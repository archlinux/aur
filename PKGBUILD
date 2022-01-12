# Maintainer: jzbor <zborof at posteo dot de>
pkgname=pademelon
pkgver=0.2.0
pkgrel=1
pkgdesc="A desktop manager for modular Linux desktop setups"
arch=(x86_64)
url="https://github.com/jzbor/pademelon"
license=('MIT')
groups=()
depends=(arandr gtk3 imlib2 libinih libx11 libxrandr python-gobject xorg-setxkbmap)
makedepends=(pkgconf)
checkdepends=()
optdepends=( 'moonwm: a good default wm'
	'pademelon-desktop: applications to make a desktop environment out of pademelon')
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
noextract=()
sha256sums=('de1498aec8eaba0c473b8ff1763f38f72e924e2184832be9ae5cd061be9d957a')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
    make
}

package() {
	cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="${pkgdir}" install-all
    # install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/$pkgname/README.md"
}


