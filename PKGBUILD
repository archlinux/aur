# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=webanalyze-bin
pkgver=0.4.6
pkgrel=1
pkgdesc="Detect technologies used on websites, for mass scanning"
arch=('x86_64' 'aarch64')
url="https://github.com/rverton/webanalyze"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/webanalyze_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/webanalyze_Linux_arm64.tar.gz")
sha256sums_x86_64=('edeb0610d4f8045b88391a2ef962968b83657746d36e954dccf70d2734758ed5')
sha256sums_aarch64=('fb480490069bad9fc6f339c731d90ae153c13255a3704aca4aeb3024fac7cb55')

package() {
  install -Dm755 "webanalyze" "${pkgdir}/usr/bin/webanalyze"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
