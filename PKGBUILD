# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=awsenv-bin
pkgver=0.0.7
pkgrel=1
pkgdesc="AWS environment config loader"
arch=('x86_64')
url='https://github.com/soniah/awsenv'
license=('MIT')
provides=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/awsenv_${pkgver}_linux_amd64.tar.gz")
sha256sums=('c86136ac89d995e1bb08a9bb590308e0d705b61369c257444cbd58f0fd4b2ce0')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}_${pkgver}_linux_amd64/${pkgname%-bin}" \
   -t "${pkgdir}/usr/bin/"
  install -Dm644 "${srcdir}/${pkgname%-bin}_${pkgver}_linux_amd64/LICENSE" \
   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
   install -Dm644 "${srcdir}/${pkgname%-bin}_${pkgver}_linux_amd64/README.md" \
   -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}