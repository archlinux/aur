# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=kernel-install-dracut-uki
pkgver=2
pkgrel=1
pkgdesc="kernel-install plugin to build UKIs with dracut"
url="https://github.com/swsnr/kernel-install-dracut-uki"
arch=('any')
license=('APACHE')
# dracut requires binutils for --uefi support
depends=('dracut' 'binutils')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('76f90eb6d6d2cbfabb1780633f72e3b3f791d96c414684219ffd62f500b01e24')
b2sums=('635d354fd796e0e10e1f1c186526b0915737f7837b6e186c6cb5281c2f1ae64f1cafb18ef995552841c39157fd9ea398ec13b8ef7d0d3b41d2a5c1d50c520942')

package() {
    make -C "${srcdir}/${pkgname}-${pkgver}" DESTDIR="${pkgdir}" install
}
