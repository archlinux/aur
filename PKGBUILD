# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.5.3
pkgrel=1
pkgdesc="Profiles for building Arch Linux Live ISO images. Featuring persistence, encryption."
arch=('any')
url="https://github.com/laurent85v/archuseriso"
license=('GPL3')
depends=('arch-install-scripts' 'bash' 'dosfstools' 'e2fsprogs' 'libisoburn' 'mtools' 'squashfs-tools' 'syslinux')
optdepends=('devtools: ZFS build option'
            'f2fs-tools: F2FS file system option'
            'pacman-contrib: ZFS build option')
conflicts=('archuseriso')
source=("http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
sha256sums=('1a93cda3f71d36eb961b5b33d54731199f6bf1c6c09c69990a033d83669e0eec'
            'SKIP')
b2sums=('824f650435fa899048e068f28aa36590077a18240ff4de96491753ab6e4abb605fafd760ba38ef5c5d215222b6844892d9d8205dd3187995b90a7d501bfff995'
        'SKIP')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install
}
