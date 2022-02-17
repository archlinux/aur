# Maintainer: jzbor <zborof at posteo dot de>
pkgname=pademelon
pkgver=1.0.1
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
sha512sums=('20b249e21b8f070b3be08ecbd09ed2d3b3c7138cbc762d3c588f738e44d2056847fa4fb5524e3d3d0e2595e3c798b4b917b908fefe8d88e9a449d8835ab3e907')
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


