# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=arch-secure-boot
pkgver=1.3.0
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
sha256sums=('226462d3218e47538da71131543b96fbc8e553e4390114bec871927336c6a7e8'
            'SKIP')
validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
