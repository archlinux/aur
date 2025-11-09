# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=miro-pdf-bin
pkgver=0.7.2
pkgrel=1
pkgdesc="A native pdf viewer for Windows and Linux (Wayland/X11) with configurable keybindings."
arch=('x86_64')
url="https://github.com/vincent-uden/miro"
license=('AGPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'fontconfig')
provides=(${pkgname::-4})
conflicts=(${pkgname::-4})
install=$pkgname.install
source=("${pkgname::-4}-${pkgver}::$url/releases/download/v${pkgver}/${pkgname::-4}"
	"$url/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('e0920c487dfc18b3c49c73a09e1594ce06513125d62670578a3dc8bb67e55035'
            '56fae99083c0ac414d88ed4e7fe658dd4b0d3cff754317dbe3d2507a8b6f55ab')
validpgpkeys=()

package() {
	cd "$srcdir"
	install -Dm775 ${pkgname::-4}-${pkgver} "$pkgdir/usr/bin/${pkgname::-4}"
	install -Dm644 "$srcdir/${pkgname::-8}-$pkgver/assets/default.conf" "$pkgdir/usr/share/${pkgname::-4}/miro.conf"
}
