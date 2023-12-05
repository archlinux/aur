# Maintainer: Maxim Baz <archlinux at maximbaz dot com>

pkgname=arch-secure-boot
pkgver=1.6.2
pkgrel=1
license=('ISC')
pkgdesc='UEFI Secure Boot for Arch Linux + btrfs snapshot recovery'
url='https://github.com/maximbaz/arch-secure-boot'
arch=('any')
depends=('sbsigntools' 'efibootmgr' 'binutils' 'edk2-shell' 'fwupd' 'linux-lts' 'snapper' 'snap-pac')
optdepends=(
    'intel-ucode: microcode update for Intel (one is required)'
    'amd-ucode: microcode update for AMD (one is required)'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/maximbaz/${pkgname}/archive/${pkgver}.tar.gz"
    "https://github.com/maximbaz/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.asc"
)
b2sums=('c75e4a6e5c6cda03989b061f92249d0f3639bfd11897ed19b2cda754adeface984808e549feb877663cbafe78d9b7397f31d67595a5dd58a0581513c32c58fd0'
        'SKIP')
validpgpkeys=('56C3E775E72B0C8B1C0C1BD0B5DB77409B11B601')

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
