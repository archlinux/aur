# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.5.2.2
pkgrel=1
pkgdesc="Profiles for building Arch Linux Live ISO images. Featuring persistence, encryption."
arch=('any')
url="https://github.com/laurent85v/archuseriso"
license=('GPL3')
depends=('arch-install-scripts' 'bash' 'dosfstools' 'e2fsprogs' 'libisoburn' 'mtools' 'squashfs-tools' 'syslinux')
optdepends=('devtools: ZFS building option'
            'f2fs-tools: F2FS file system option'
            'pacman-contrib: ZFS building option')
conflicts=('archuseriso')
source=("http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
sha256sums=('68c84f56717a14ae28b5d26f720d6b3e612f8d7c5a933e2196adf529b13423dc'
            'SKIP')
b2sums=('fc117387187bc77ffa2181fc160f7cdb11c1823aea29b2c0592ba19c8830ddcb04577b2f45cc939259d6fec42d7e06fd2a423f2539e131d559ca4c4d122a4ecf'
        'SKIP')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install
}
