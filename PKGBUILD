# Maintainer: flan_suse <windows2linux_AT_zoho_DOT_com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=czkawka-cli-bin
pkgver=7.0.0
pkgrel=3
pkgdesc='Find and manage duplicate files, empty folders, similar images, and other "lint" (CLI)'
arch=('x86_64')
url='https://github.com/qarmin/czkawka'
license=('MIT')
provides=('czkawka-cli')
conflicts=('czkawka-cli')
depends=('gcc-libs')
source=("${pkgname}-${pkgver}::https://github.com/qarmin/czkawka/releases/download/${pkgver}/linux_${pkgname%-cli-bin}_cli"
        "LICENSE-${pkgver}::https://github.com/qarmin/czkawka/raw/${pkgver}/${pkgname%-cli-bin}_cli/LICENSE")
sha256sums=('72adf315beac47a421cb5663816d900d630910f5f69c717cc1deca3d910bef7d'
            '56eccbc190b8a00bb17a1ba7e657bf4d4ae26284d4c32c8c8a010949241cd4a3')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE-${pkgver} "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
