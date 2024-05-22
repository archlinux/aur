# Maintainer: Bradley O'Connell <bradleyocon@gmail.com>
# Contributor: Brodi <me@brodi.space>

_plugin=file-sharing
pkgname="cockpit-${_plugin}"
pkgver="3.3.7"
pkgrel=1
pkgdesc="A Cockpit plugin to easily manage samba and NFS file sharing."
arch=("any")
url="https://github.com/45Drives/cockpit-file-sharing"
license=("GPL-3.0")
depends=("cockpit" "python" "samba" "nfs-utils")
makedepends=("make")
provides=("${pkgname}")
source=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_generic.zip")
sha512sums=("94265c91aae54b377fafecef3e921639cf7f678a837393b9a2fed0ba8f5f3a7fe838bec13c700f2b5a4b30664872e8850fec4ad51cb79dcd9fb0668d178dc74b")

package() {
    cd "${srcdir}/${pkgname}_${pkgver}_generic"
    make DESTDIR="${pkgdir}/" install RESTART_COCKPIT=1
}

