# Maintainer: Kamil Cukrowski <kamilcukrowski@gmail.com>
pkgname=grub-netboot-archlinux
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc="Adds archlinux netboot entry to grub-mkconfig for easy boot"
arch=(any)
url="https://archlinux.org/releng/netboot/"
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
	"netboot-archlinux.lkrn::https://archlinux.org/static/netboot/ipxe-arch.7db2ebf431ea.lkrn"
	"netboot-archlinux.lkrn.sig::https://archlinux.org/static/netboot/ipxe-arch.lkrn.612c3a5236b0.sig"
	"61_netboot_archlinux"
)
noextract=()
sha256sums=('19efbe655edd36809566ffc901d3afdb05e30147ca3a337e7fcf22652266e30d'
            'SKIP'
            '288b812af56cd584e6d8a01653ef5de0e56556667f20dc23f9496f1e9feb8dac')
validpgpkeys=('C7E7849466FE2358343588377258734B41C31549')

package() {
	install -vD -m 644 netboot-archlinux.lkrn "$pkgdir"/boot/netboot-archlinux.lkrn
	install -vD -m 755 61_netboot_archlinux "$pkgdir"/etc/grub.d/61_netboot_archlinux
}
