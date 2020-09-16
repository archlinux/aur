# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.5.2
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
sha256sums=('4b12fd4c5f19218cc66252dc059b6b5df681f5a297a76f12c235ee68c900ad9c'
            'SKIP')
b2sums=('25ab1ec30cd6290fecfc69fc9f1f3482db0500f1801b2e765e3b5298afed3477944603f5432e76768371dc4dbfa1137e9b4e27a2ecdc8e955b5bb366778af808'
        'SKIP')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install
}
