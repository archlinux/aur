# Maintainer: jzbor <zborof at posteo dot de>
pkgname=pademelon
pkgver=0.3.0
pkgrel=1
pkgdesc="A desktop manager for modular Linux desktop setups"
arch=(x86_64)
url="https://github.com/jzbor/pademelon"
license=('MIT')
groups=()
depends=(acpilight arandr gtk3 imlib2 libcanberra libinih libpulse libx11 libxrandr lxappearance-gtk3
            python-gobject xorg-setxkbmap)
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
sha256sums=('2fec6b1a97302b8149bb9409117609a60a367b3605d43fce5bca92d7f9ee19f2')
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
    install -Dm644 doc/* -t "${pkgdir}/usr/share/doc/$pkgname"
}


