# Maintainer: François Freitag <mail@franek.fr>
pkgname=mutt-gnome-contacts
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Queries the GNOME contacts database and outputs results in a mutt-compatible format"
arch=('x86_64')
url="https://github.com/francoisfreitag/mutt-gnome-contacts"
license=('MIT')
groups=()
depends=('folks')
makedepends=('meson' 'vala')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
noextract=()
b2sums=('4bcdfd26b3adc0e6e10d29274cfa26ed9cf3ae9a03dbfe92592875c5e1dfeb31ed5f5c44897e5be0e9894c5fc965a4083dc33010e9d36e412d5ae074ec18746f')
validpgpkeys=()

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
