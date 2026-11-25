# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ftpserver-bin
pkgver=0.16.8
pkgrel=1
pkgdesc="FTP server with SFTP, S3, Dropbox and Google Drive backends"
arch=('x86_64' 'aarch64')
url="https://github.com/fclairamb/ftpserver"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ftpserver-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ftpserver-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('16c05b26073dd99451c22adb10eb86c3db116c02d6ba35b6a3f870ffdb569a4c')
sha256sums_aarch64=('1346289c8b28750048ef5fbda69b4db2f3f5282722ab6d451e7633e6c8c91ade')

package() {
  install -Dm755 "ftpserver" "${pkgdir}/usr/bin/ftpserver"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
