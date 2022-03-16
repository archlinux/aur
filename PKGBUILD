# Maintainer: jzbor <zborof at posteo dot de>
pkgname=pademelon
pkgver=1.0.4
pkgrel=1
pkgdesc="A desktop manager for modular Linux desktop setups"
arch=(x86_64)
url="https://github.com/jzbor/pademelon"
license=('MIT')
groups=()
depends=(acpilight arandr gtk3 imagemagick imlib2 libcanberra libinih libpulse libx11 libxrandr
            lxappearance-gtk3 python-gobject python3 xorg-setxkbmap)
makedepends=(go-md2man pkgconf)
checkdepends=()
optdepends=( 'moonwm: a good default wm'
	'pademelon-desktop: applications to make a desktop environment out of pademelon')
provides=(xdg-xmenu)
conflicts=(xdg-xmenu)
replaces=()
backup=()
options=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
noextract=()
sha512sums=('7bf33765d2e67c4d3582a0f68199eac307d1ddfaec2430f7304fb92410842d662b7752766a847c76d285925bbdc4639f2023b1bb37b5990d2fc702ada582a6b0')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
    make
}

package() {
	cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="${pkgdir}" install-all
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/$pkgname/README.md"
    install -Dm644 doc/* -t "${pkgdir}/usr/share/doc/$pkgname"
}


