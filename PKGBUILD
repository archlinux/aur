# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=s5cmd-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Parallel S3 and local filesystem execution tool"
arch=('x86_64')
url='https://github.com/peak/s5cmd'
license=('MIT')
provides=("${pkgname%-bin}")
source=("${url}/releases/download/v${pkgver}/s5cmd_${pkgver}_Linux-64bit.tar.gz")
sha256sums=('a56eab6493fa6613d525e7329dc15ba161cd233708f3a0b168829934731c60f2')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" \
   "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "${srcdir}/LICENSE" \
   "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
  install -Dm644 "${srcdir}/README.md" \
   -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}