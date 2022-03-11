# Maintainer: jzbor <zborof at posteo dot de>
pkgname=pademelon
pkgver=1.0.3
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
sha512sums=('58872f37e25247474b0e73dddd0369292b5bbf0a53838f3c2c51f3f1fc99b832ea1945ee97c03a9c416b57f10082eb958684b810e6f8972ff82f7ea2c084d18b')
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


