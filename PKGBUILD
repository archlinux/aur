# Maintainer: jzbor <zborof at posteo dot de>
pkgname=pademelon
pkgver=0.1.0
pkgrel=1
pkgdesc="A desktop manager for modular Linux desktop setups"
arch=(x86_64)
url="https://github.com/jzbor/pademelon"
license=('MIT')
groups=()
depends=(arandr imlib2 libinih libx11 libxrandr python-gobject xorg-setxkbmap)
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
sha256sums=('0d1b88739f40f9849d7ae936fb91cb020cbde2d4e9b9aa29c90173eb8a3e6282')
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


