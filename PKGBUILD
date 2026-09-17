# Maintainer: flan_suse <windows2linux_AT_zoho_DOT_com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=czkawka-cli-bin
pkgver=12.0.2
pkgrel=1
pkgdesc='Find and manage duplicate files, empty folders, similar images, and other "lint" (CLI)'
arch=('x86_64')
url='https://github.com/qarmin/czkawka'
license=('MIT')
provides=('czkawka-cli')
conflicts=('czkawka-cli')
depends=('gcc-libs' 'libheif')
options=('!debug')
source=("${pkgname}-${pkgver}::https://github.com/qarmin/czkawka/releases/download/${pkgver}/linux_${pkgname%-cli-bin}_cli_heif_raw_avif_x86_64"
        "LICENSE_MIT-${pkgver}::https://github.com/qarmin/czkawka/raw/${pkgver}/${pkgname%-cli-bin}_cli/LICENSE_MIT")
sha256sums=('b62cf139ba6e0331e4a279d75d0caf5bfa81f16c645fdf0008dc7a830573e05f'
            'fe124add5f02776eb9152b4e3c343539cf802babd06a09f9c5237448476d8d03')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE_MIT-${pkgver} "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE_MIT"
}
