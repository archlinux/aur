# Maintainer: SysAdm <sysadm.archlinux@proton.me>
# Contributor: Asuka Minato
pkgname=caido-desktop
pkgver=0.40.0
pkgrel=2
pkgdesc="A lightweight web security auditing toolkit."
arch=('x86_64')
url="https://caido.io/"
license=('private')
depends=(glibc gcc-libs)
provides=(caido)
source=("https://storage.googleapis.com/caido-releases/v${pkgver}/caido-desktop-v${pkgver}-linux-x86_64.AppImage")
sha256sums=('88d862b4235cdb6d69630706fb4ec6bcff9b9d376d406163b25a10e4fb61da5d')

prepare() {
	chmod +x *.AppImage
	./*.AppImage --appimage-extract
	mv squashfs-root/* ./
}

package() {
	cp caido $pkgdir/
	cp -a usr $pkgdir/
}
