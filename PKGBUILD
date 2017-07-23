# Maintainer: Andrei Alexeyev <akari@alienslab.net>

pkgname=nexuiz-data
pkgver=2.5.2
pkgrel=1
epoch=1
arch=('any')
pkgdesc="Fast-paced multiplayer first-person shooter (data files only)."
url="http://www.alientrap.com/games/nexuiz/"
license=("GPL2")
depends=()
makedepends=('unzip')
conflicts=('nexuiz')
_zipfile="${pkgname%%-data}-${pkgver//./}.zip"
source=("https://downloads.sourceforge.net/project/nexuiz/NexuizRelease/Nexuiz%20${pkgver}/${_zipfile}")
noextract=("${_zipfile}")
sha256sums=('a5e27ebcc9775c4a490d0d3536c32e4a8f8f96b038c0b6a78d1823c37a962000')

# Prevent compressing final package
PKGEXT='.pkg.tar'

package() {
    install -dm755 "${pkgdir}/usr/share/nexuiz"
    unzip -j "${_zipfile}" Nexuiz/data/common-spog.pk3 Nexuiz/data/data20091001.pk3 -d "${pkgdir}/usr/share/nexuiz/data"
    find "${pkgdir}/usr/share/nexuiz" -type f -exec chmod 644 {} \;
}
