# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=miro-pdf-bin
pkgver=0.9.1
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
sha256sums=('5a4aeaf2a3e361830b48d5576500627c633fa81f07c1dcb59babd312c48615d0'
            'b550a547049ce775fcabe23247ac7f3fa93987e0ffff2e7a44497db443afab16')
validpgpkeys=()

package() {
	cd "$srcdir"
	install -Dm775 ${pkgname::-4}-${pkgver} "$pkgdir/usr/bin/${pkgname::-4}"
	install -Dm644 "$srcdir/${pkgname::-8}-$pkgver/assets/default.conf" "$pkgdir/usr/share/${pkgname::-4}/miro.conf"
}
