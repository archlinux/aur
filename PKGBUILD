# Maintainer: Maxim Baz <archlinux at maximbaz dot com>

pkgname=arch-secure-boot
pkgver=1.6.1
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
b2sums=('7dcd857a951e73adf22ec6ffd0db9799d4adf87952d13c8f2786354afc0e8663569df054e5218198b105f8cf0e60f72902e560267e4213cd2a7b389dc51ad76b'
        'SKIP')
validpgpkeys=('56C3E775E72B0C8B1C0C1BD0B5DB77409B11B601')

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
