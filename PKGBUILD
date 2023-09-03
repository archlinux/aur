# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.7.12
pkgrel=1
pkgdesc="Create bootable disk images of Arch Linux, install to an external USB disk or thumb drive"
arch=('any')
url="https://github.com/laurent85v/archuseriso"
license=('GPL3')
depends=('arch-install-scripts' 'bash' 'dosfstools' 'e2fsprogs' 'erofs-utils' 'grub' 'libarchive' 'libisoburn' 'make' 'mtools' 'parted' 'squashfs-tools' 'syslinux')
optdepends=('devtools: for building ZFS packages'
            'edk2-ovmf: for emulating UEFI with aui-run'
            'erofs-utils: for experimental EROFS support in aui-mkiso'
            'f2fs-tools: for F2FS file system option'
            'openssl: for codesigning support when building netboot artifacts'
            'pacman-contrib: for building ZFS packages'
            'qemu-base: virtual machine for aui-run')
conflicts=('archuseriso')
source=("http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
sha256sums=('15d22bd6c09dc01e228183a8ad4ef5171ef06f357763df03f65661f43f4e8de8'
            'SKIP')
b2sums=('ada05bbc12541e2a8bd2396b18795ed063958355b216ddc05fc32efbe520ce2ecffc182a4df07966f8430d08aba1b335848328a93d7a842cac2d8c54d1502ad4'
        'SKIP')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
