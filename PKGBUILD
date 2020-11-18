# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=s5cmd-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Parallel S3 and local filesystem execution tool"
arch=('x86_64')
url='https://github.com/peak/s5cmd'
license=('MIT')
provides=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/s5cmd_${pkgver}_Linux-64bit.tar.gz")
sha256sums=('ae6f16aa76a3bbb4203fe4533d866d15555905c415e82841f1394ea55770b9dc')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" \
   "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "${srcdir}/LICENSE" \
   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" \
   -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}
