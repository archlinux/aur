# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.7.3.1
pkgrel=1
pkgdesc="Scripts for building ISO images and making bootable USB drives"
arch=('any')
url="https://github.com/laurent85v/archuseriso"
license=('GPL3')
depends=('arch-install-scripts' 'bash' 'dosfstools' 'e2fsprogs' 'erofs-utils' 'grub' 'libarchive' 'libisoburn' 'mtools' 'squashfs-tools' 'syslinux')
optdepends=('devtools: for building ZFS packages'
            'edk2-ovmf: for emulating UEFI with aui-run'
            'erofs-utils: for experimental EROFS support in aui-mkiso'
            'f2fs-tools: for F2FS file system option'
            'openssl: for codesigning support when building netboot artifacts'
            'pacman-contrib: for building ZFS packages'
            'qemu-desktop: virtual machine for aui-run')
conflicts=('archuseriso')
source=("http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
sha256sums=('8caf70869fd5ccfd55c1413a13943f07f452b79f9a2b4bbd223758ddf50a2565'
            'SKIP')
b2sums=('e1696715e91047e8c354aab0e1bc87044a0e9e68a5597522d38b7a59ace2b890e453bd6e14e034fbaf8f0c9b067e4e8af6fbc9e7d0f38aedb289e453bb1142c6'
        'SKIP')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
