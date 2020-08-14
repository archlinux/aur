# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.5
pkgrel=1
pkgdesc="Profiles for building Arch Linux Live ISO images. Featuring persistence, encryption."
arch=('any')
url="https://github.com/laurent85v/archuseriso"
license=('GPL3')
depends=('archiso' 'syslinux')
optdepends=('devtools: ZFS building option'
            'pacman-contrib: ZFS building option')
conflicts=('archuseriso')
install=archuseriso.install
source=("http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig"
        "archuseriso.install")
sha256sums=('9972eb7328a55471f79b18398b20e4ef3ad727471ca35bbcfa62f09ad5f88596'
            'SKIP'
            '15f8769f89985ae9be847c1c308614c1725204bb7d29565582da6e5be02b7e9a')
b2sums=('1d5618254bdcc256b5bd85aace3f5d395d6293ea2a20eac19baac27d2d472c13a2adb41c8b3266c8b2d286ddd4c59335f2109fe58ad6b4e80d11d9ef0c2ce775'
        'SKIP'
        '0294e1190722e008c075ba14565b3f44a4c68fd35efdca46be6a1a37baf3c50df11243ef845fba5255e1d38ec0144f4998c9cb325206a289c305676bd9bcb01f')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install
}
