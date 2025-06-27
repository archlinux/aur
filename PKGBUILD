# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=pineflash-bin
pkgver=0.5.5
pkgrel=2
pkgdesc="A tool to flash ironos to the pinecil soldering iron and possibly other pine64 devices in the future"
arch=('x86_64')
url="https://github.com/Spagett1/PineFlash"
license=('GPL-2.0-or-later')
depends=('glibc' 'libusb' 'curl' 'bzip2' 'systemd-libs' 'gcc-libs' 'blisp')
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("$url/releases/download/${pkgver}/${pkgname::-4}-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('7e7a4c2f0c3d4348c714b67c8382d474452eb211242f22366b49abd1356e3dfb')

package() {
	cd "$srcdir"
	install -Dm755 usr/bin/pineflash "$pkgdir/usr/bin/pineflash"
	install -Dm644 usr/share/applications/Pineflash.desktop "$pkgdir/usr/share/applications/pineflash.desktop"
	install -Dm644 usr/share/pixmaps/pine64logo.png "$pkgdir/usr/share/pixmaps/pine64logo.png"
}
