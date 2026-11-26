# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nonograph-bin
pkgver=0.5.6
pkgrel=1
pkgdesc="Minimalist anonymous publishing tool"
arch=('x86_64' 'aarch64')
url="https://github.com/du82/nonograph"
license=('Unlicense')
depends=('glibc' 'libgcc' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/nonograph-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/nonograph-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('e460567af49f2ed371d351c85769e8b36620c6ccdd71f47b0bbf00e9a19afafe')
sha256sums_aarch64=('699528e6f058bcc80d83fcf1e721583a728d82dae1023cf61105ebfb7edd847e')

package() {
  install -Dm755 "./nonograph" "${pkgdir}/usr/bin/nonograph"
  install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "./README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
