# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=miro-pdf-bin
pkgver=0.7.0
pkgrel=2
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
sha256sums=('06fc763164d1ab80336749b695561abb146a3f7d68ef61294745d03b740e0496'
            'cea71eb4912feb726c53fa2c53d8da6a96d44343d73584ae639092c5a4de0997')
validpgpkeys=()

package() {
	cd "$srcdir"
	install -Dm775 ${pkgname::-4}-${pkgver} "$pkgdir/usr/bin/${pkgname::-4}"
	install -Dm644 "$srcdir/${pkgname::-8}-$pkgver/assets/default.conf" "$pkgdir/usr/share/${pkgname}/miro.conf"
}
