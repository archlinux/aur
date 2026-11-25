# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=allinssl-bin
pkgver=1.1.4
pkgrel=1
pkgdesc="AllinSSL SSLAllinSSL is an all-in-one SSL certificate lifecycle management tool that integrates certificate application, management, deployment, and monitoring"
arch=('x86_64' 'aarch64')
url="https://github.com/allinssl/allinssl"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/allinssl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/allinssl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('e5cf94d3f615cc1c0adecfcad99339fb2ca6908e7a06cfb04945274e9b9f404e')
sha256sums_aarch64=('1aa5b8f582838459deb835d143f1d53713721890f33202a09c99a5b296977e11')

package() {
  install -Dm755 "allinssl" "${pkgdir}/usr/bin/allinssl"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
