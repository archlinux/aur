# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=s3deploy-bin
pkgver=2.16.0
pkgrel=1
pkgdesc="Deploy static websites to Amazon S3 and CloudFront"
arch=('x86_64')
url="https://github.com/bep/s3deploy"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/s3deploy_${pkgver}_linux-amd64.tar.gz")
sha256sums_x86_64=('66ea2e9fe04b28784899c9d76c3813ffcd39ae602cc3933b205daa23a553f6dc')

package() {
  install -Dm755 "s3deploy" "${pkgdir}/usr/bin/s3deploy"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
