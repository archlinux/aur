# Maintainer: Kamil Cukrowski <kamilcukrowski@gmail.com>
pkgname=grub-netboot-alpine
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc="Adds netboot alpine entry to grub-mkconfig for each boot"
arch=(any)
url="https://boot.alpinelinux.org/"
license=('GPL')
groups=()
depends=(grub)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"netboot-alpine.lkrn::https://boot.alpinelinux.org/alpine-ipxe/x86_64/ipxe.lkrn"
	"61_netboot_alpine"
)
noextract=()
sha256sums=('576087813e14e3f737e753d765014cda0d335b6a007009cea51b5842dd655ebe'
            '140fcf9b26086acea655dafd0b8dd9fcea8da415cdf80d6e75b5af293149cb0e')
validpgpkeys=()

package() {
	install -vD -m 644 netboot-alpine.lkrn "$pkgdir"/boot/netboot-alpine.lkrn
	install -vD -m 755 61_netboot_alpine "$pkgdir"/etc/grub.d/61_netboot_alpine
}
