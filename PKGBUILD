# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.6
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
sha256sums=('2dc5f6b40d673d8cb6d1a8e801f575bf263e10f2ce60207322de6ebea4d0d4ca'
            'SKIP')
b2sums=('50f80c5e4e9291c8df70bf4fb6995c79bda3becbc70eb658dd72776fe62eb0a846c58a429d1d2ef32dee566ab1d21df0cded39bfc72cfd8c23b62e83d5ed7165'
        'SKIP')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install
}
