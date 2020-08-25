# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=arch-secure-boot
pkgver=1.0.1
pkgrel=1
license=('MIT')
pkgdesc='UEFI Secure Boot for Arch Linux + btrfs snapshot recovery'
url='https://github.com/maximbaz/arch-secure-boot'
arch=('any')
depends=('efitools' 'sbsigntools' 'efibootmgr' 'binutils' 'edk2-shell' 'linux-lts' 'snapper' 'snap-pac')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/maximbaz/${pkgname}/archive/${pkgver}.tar.gz"
        "https://github.com/maximbaz/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('47df838870622b176e1d68a01154552b537afd6ae6dfcad62aab4532e57adcef'
            'SKIP')
validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
