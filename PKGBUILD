# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.5.4.1
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
sha256sums=('617ddf530af50a6904327dbb47bdff717fb77eb4776bfdcbff1b47963534176c'
            'SKIP')
b2sums=('a70cb1cefe21628a68a09758cd0370b8167c8a5c30086783e8152726a25b3d452f1509f1615bb4e5aaf6a6ea77c8ebeb9b28cc0aa95d7a730e73683a629b91aa'
        'SKIP')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install
}
