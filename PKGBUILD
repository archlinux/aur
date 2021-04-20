# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.6.4.1
pkgrel=1
pkgdesc="Build iso images, create live usb drives, install on usb drives."
arch=('any')
url="https://github.com/laurent85v/archuseriso"
license=('GPL3')
depends=('arch-install-scripts' 'bash' 'dosfstools' 'e2fsprogs' 'libisoburn' 'mtools' 'squashfs-tools' 'syslinux')
optdepends=('devtools: for building ZFS packages'
            'edk2-ovmf: for emulating UEFI with aui_run'
            'erofs-utils: for experimental EROFS support in aui-mkiso'
            'f2fs-tools: for F2FS file system option'
            'pacman-contrib: for building ZFS packages'
            'qemu: virtual machine for aui_run')
conflicts=('archuseriso')
install=archuseriso.install
source=("http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
sha256sums=('06311f158be235852a90031d7f63b88cd8fc2ae378725236c986807d77f98a54'
            'SKIP')
b2sums=('87534cfc8dd68ce0e7b33d4b9740a336f5e0a739125c72575d90012c184c459329b54a8f54b58d1dbc8800185c01e5baddd11472b783b52ddc0b0363ef66faa6'
        'SKIP')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install
}
