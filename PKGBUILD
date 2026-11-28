# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=recipya-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="Self-hosted recipe manager"
arch=('x86_64' 'aarch64')
url="https://github.com/reaper47/recipya"
license=('GPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/recipya-linux-amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/recipya-linux-arm64.zip")
sha256sums_x86_64=('705cd044de296a2bd49ea00850e94a562d156f06c00be4624a298ec2ca871fcc')
sha256sums_aarch64=('46310e483cc57ce19dd418c4301d5e1451652084b33c5a92d042135f205b2d7f')

package() {
  install -Dm755 "recipya" "${pkgdir}/usr/bin/recipya"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
