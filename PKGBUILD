# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.8.1
pkgrel=1
pkgdesc="Create bootable disk images of Arch Linux, install to USB disk or thumb drive"
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
            'qemu-desktop: virtual machine for aui-run testings')
conflicts=('archuseriso')
source=("http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
sha256sums=('45eff0e1cf7a6a458b76f5398ae227ceb63ea0a8e11b8683f2679d25498f166a'
            'SKIP')
b2sums=('1414846f15a83ee5b12892368cdfdde8ee25fd13fa752a40f5c890c331117d88213f1f83015f545c0a78abd27a7c38f93fd403bee033effbb00703933e17bd55'
        'SKIP')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
