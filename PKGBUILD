# Maintainer: Xandar Null <xandar.null@gmail.com>

pkgname=freezer-bin
pkgver=1.1.17
pkgrel=1
epoch=
pkgdesc="Free HQ music streaming app (Official)"
arch=(x86_64)
url="https://git.rip/freezer/freezerpc"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(freezer-bin)
conflicts=(freezer-git)
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"$pkgname.desktop"
	https://git.freezer.life/exttex/freezerpc/raw/branch/master/app/assets/icon.png
)
source_x86_64=("https://files.freezer.life/0:/PC/1.1.17/freezer_1.1.17_amd64.deb")
noextract=()
validpgpkeys=()


build() {
	
	# Extraction
	mkdir -p "${srcdir}/output"
	tar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/output"
}

package() {

	# Installation
	cp -r "${srcdir}/output/"* "${pkgdir}"

	# Desktop launcher
	install -dm755 "$pkgdir/usr/share/pixmaps/"
	install -dm755 "$pkgdir/usr/share/applications/"
	install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/freezer.png"
	install -Dm644 "$srcdir/freezer-bin.desktop" "$pkgdir/usr/share/applications/freezer.desktop"
	install -dm755 "$pkgdir/$HOME/Desktop/"
	cp -r "${srcdir}"/freezer-bin.desktop "${pkgdir}"$HOME/Desktop
	sudo ln -sf /opt/Freezer/freezer /usr/local/bin/freezer

}
md5sums=('SKIP'
         'SKIP')
md5sums_x86_64=('SKIP')
