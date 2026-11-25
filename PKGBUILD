# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gobackup-bin
pkgver=3.1.1
pkgrel=1
pkgdesc="Scheduled backups of databases and files to cloud storage"
arch=('x86_64' 'aarch64')
url="https://github.com/gobackup/gobackup"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gobackup-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/gobackup-linux-arm64.tar.gz")
sha256sums_x86_64=('d4ec264c2f266742aa370e90a1666535917de0207bd908786823415fce4924c6')
sha256sums_aarch64=('517eda21d4e56e0faa0e15c110d395d83fe987bfce26eaab81cee81fe55ff9f8')

package() {
  install -Dm755 "gobackup" "${pkgdir}/usr/bin/gobackup"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
