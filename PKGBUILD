# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=miro-pdf-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="A native pdf viewer for Windows and Linux (Wayland/X11) with configurable keybindings."
arch=('x86_64')
url="https://github.com/vincent-uden/miro"
license=('AGPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'fontconfig' 'freetype2')
provides=(${pkgname::-4})
conflicts=(${pkgname::-4})
install=$pkgname.install
source=("${pkgname::-4}-${pkgver}::$url/releases/download/v${pkgver}/${pkgname::-4}"
	"$url/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('c434bc1753516728d36cfdbccd9bab16b9c9691cda612ef7b01b50fa5972c0cd'
            'e082e7b4280a6bfb4af891a5d1202c723a88e551e13a6b4745831937dc17c97f')
validpgpkeys=()

package() {
	cd "$srcdir"
	install -Dm775 ${pkgname::-4}-${pkgver} "$pkgdir/usr/bin/${pkgname::-4}"
	install -Dm644 "$srcdir/${pkgname::-8}-$pkgver/assets/default.conf" "$pkgdir/usr/share/${pkgname::-4}/miro.conf"
}
