# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.5.0.1
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
sha256sums=('a84337fe79f989758888780e9a12d6875dcb94143493ae4a7b8119ab052b8404'
            'SKIP'
            '15f8769f89985ae9be847c1c308614c1725204bb7d29565582da6e5be02b7e9a')
b2sums=('792df50cc29f66ae69ba7e8856afe08e5eebdedad5b9bdc119cec1716e6cacdff7f931bfdea4a179e7a974450ac5599b3df0bd4c6fc7b30d2736dd5de245b1f6'
        'SKIP'
        '0294e1190722e008c075ba14565b3f44a4c68fd35efdca46be6a1a37baf3c50df11243ef845fba5255e1d38ec0144f4998c9cb325206a289c305676bd9bcb01f')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install
}
