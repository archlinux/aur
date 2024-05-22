# Maintainer: Bradley O'Connell <bradleyocon@gmail.com>
# Contributor: Brodi <me@brodi.space>

_plugin=file-sharing
pkgname="cockpit-${_plugin}"
pkgver="3.3.6"
pkgrel=1
pkgdesc="A Cockpit plugin to easily manage samba and NFS file sharing."
arch=('any')
url="https://github.com/45Drives/cockpit-file-sharing"
license=('GPL3')
depends=("cockpit" "python" "samba" "nfs-utils")
makedepends=("make")
provides=("${pkgname}")
source=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_generic.zip")
sha512sums=("5a022bcbf9e4b7725fb96fb03748e912de45ea5361a38959dda174b2bf5e4640b364786ffa157cfab986c83e8219d7fb24843860655d89b63ff66efd13eb43c6")

package() {
    cd ${pkgname}_${pkgver}_generic
    sudo make install RESTART_COCKPIT=1
}

