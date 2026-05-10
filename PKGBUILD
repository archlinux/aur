# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=miro-pdf-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="A native pdf viewer for Windows and Linux (Wayland/X11) with configurable keybindings."
arch=('x86_64')
url="https://github.com/vincent-uden/miro"
license=('AGPL-3.0-or-later')
depends=('libstdc++' 'libgcc' 'glibc' 'fontconfig')
provides=(${pkgname::-4})
conflicts=(${pkgname::-4})
install=$pkgname.install
source=("${pkgname::-4}-${pkgver}::$url/releases/download/v${pkgver}/${pkgname::-4}"
	"$url/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('6808ce218e253f112b20adebb74c5ca1c052708696a9cb5b5b199d2460f1d5da'
            '3ed28fa23f700bb9bbabbc3415b5ad9c9baa3cac7d9558ebc90314ca9fab1a9b')
validpgpkeys=()

package() {
	cd "$srcdir"
	install -Dm775 ${pkgname::-4}-${pkgver} "$pkgdir/usr/bin/${pkgname::-4}"
	install -Dm644 "$srcdir/${pkgname::-8}-$pkgver/assets/default.conf" "$pkgdir/usr/share/${pkgname::-4}/miro.conf"
}
