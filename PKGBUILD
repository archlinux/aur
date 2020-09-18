# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.5.2.1
pkgrel=1
pkgdesc="Profiles for building Arch Linux Live ISO images. Featuring persistence, encryption."
arch=('any')
url="https://github.com/laurent85v/archuseriso"
license=('GPL3')
depends=('arch-install-scripts' 'bash' 'dosfstools' 'e2fsprogs' 'libisoburn' 'squashfs-tools' 'syslinux')
optdepends=('devtools: ZFS building option'
            'f2fs-tools: F2FS file system option'
            'pacman-contrib: ZFS building option')
conflicts=('archuseriso')
install=archuseriso.install
source=("http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
sha256sums=('0d43ae40ccac83666f588f2cf0ad6fb2463e7350eaa79077788a536b9ec3e930'
            'SKIP')
b2sums=('fed2a53f8b3546513d25d7c479fc7e6ab36b73ec32816c98fe3979e5522d6813b3702834dbf7059fbcf47dd702641ebcf2e30c1f514bf2a9608393f5b9d78cd0'
        'SKIP')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install
}
