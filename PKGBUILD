# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=arch-secure-boot
pkgver=1.5.0
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
sha256sums=('e512c559ca6e66c3a3b9560b7cbf7136f0d46766d8a4615a2a8940c6e984ad24'
            'SKIP')
validpgpkeys=('56C3E775E72B0C8B1C0C1BD0B5DB77409B11B601')

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
