# See contacts at https://aur.archlinux.org/cgit/aur.git/tree/README.md?h=amneziawg-dkms-git

pkgname=amneziawg-dkms-git
_pkgname=amneziawg-linux-kernel-module
pkgver=r1344.ac946a9
pkgrel=2
pkgdesc="AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard"
arch=("any")
url="https://github.com/amnezia-vpn/amneziawg-linux-kernel-module"
license=("GPLv2")
depends=("dkms")
makedepends=("git")
provides=(AMNEZIAWG-MODULE)
conflicts=("$_pkgname")
source=("git+https://github.com/amnezia-vpn/amneziawg-linux-kernel-module.git")
sha256sums=("SKIP")

pkgver() {
    cd "${srcdir}/${_pkgname}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}/src"

    make DESTDIR="${pkgdir}" dkms-install
}
