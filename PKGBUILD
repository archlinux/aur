# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=arch-secure-boot
pkgver=1.2.3
pkgrel=1
license=('MIT')
pkgdesc='UEFI Secure Boot for Arch Linux + btrfs snapshot recovery'
url='https://github.com/maximbaz/arch-secure-boot'
arch=('any')
depends=('efitools' 'sbsigntools' 'efibootmgr' 'binutils' 'edk2-shell' 'fwupd' 'linux-lts' 'snapper' 'snap-pac')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/maximbaz/${pkgname}/archive/${pkgver}.tar.gz"
        "https://github.com/maximbaz/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('cd8f0ae2448fc52cfaa6883f11d4b2b265ecdaeec2bd7d21db8d80b3e949a830'
            'SKIP')
validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
