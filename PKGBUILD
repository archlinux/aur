# Maintainer: DarkBlackChocolate <dbchoco.muezzin@gmail.com>
pkgname="muezzin-bin"
pkgver=2.6.0
pkgrel=1
pkgdesc="Islamic prayer times and adhan application"
arch=('x86_64')
conflicts=(${pkgname%-*}-{appimage,electron} "muezzin")
depends=('zstd' 'gtk3' 'alsa-lib' 'nss')
url="https://github.com/DBChoco/Muezzin"
license=('MIT')
_filename=muezzin-${pkgver}.pacman
source=("$_filename::https://github.com/DBChoco/Muezzin/releases/download/v${pkgver}/$_filename")
noextract=("${_filename}")
md5sums=('SKIP')

package() {
	tar -xJv -C "${pkgdir}" -f "${srcdir}/${_filename}" usr opt
	mkdir "$pkgdir/usr/bin"
	ln -s "/opt/muezzin/muezzin" "$pkgdir/usr/bin/muezzin"
}



