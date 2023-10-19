# Maintainer: Bradley O'Connell <bradleyocon@gmail.com>
# Contributor: Brodi <me@brodi.space>

_plugin=file-sharing
pkgname="cockpit-${_plugin}"
pkgver="3.3.4"
pkgrel=1
pkgdesc="A Cockpit plugin to easily manage samba and NFS file sharing."
arch=('any')
url="https://github.com/45Drives/cockpit-file-sharing"
license=('GPL3')
depends=("cockpit" "python" "samba" "nfs-utils")
makedepends=("cockpit" "make")
provides=("${pkgname}")
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-${pkgrel}.el8.noarch.rpm")
sha512sums=("1ecd1a8e2c3e65a853e6b9320257a4ca4b8a4c2932a55fd3fa434bd18b2508aab4be306209b9568639198a5113375c23dd7580217524fa93e88b628d628d897a")

package() {
    find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"
}

