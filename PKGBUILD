# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.6.0.1
pkgrel=1
pkgdesc="Build iso images, create live usb drives, install on usb drives."
arch=('any')
url="https://github.com/laurent85v/archuseriso"
license=('GPL3')
depends=('arch-install-scripts' 'bash' 'dosfstools' 'e2fsprogs' 'libisoburn' 'mtools' 'squashfs-tools' 'syslinux')
optdepends=('devtools: ZFS build option'
            'f2fs-tools: F2FS file system option'
            'pacman-contrib: ZFS build option')
conflicts=('archuseriso')
install=archuseriso.install
source=("http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
sha256sums=('2d1445788f8634cf858c973cee1a67b0c12410f30af406bb87843a16cf6aeadd'
            'SKIP')
b2sums=('bc2749e588cc66a941a005f700d642227da38558c4c9e1327ffee81c8a706e084853a01e0a8de82e21a206d50f30735367df5727664e73790541a334fa4f7204'
        'SKIP')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install
}
