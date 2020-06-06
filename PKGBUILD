# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=benthos-bin
pkgver=3.16.0
pkgrel=1
pkgdesc="A stream processor for mundane tasks written in Go"
arch=('x86_64')
url='https://benthos.dev'
depends=('glibc')
license=('MIT')
provides=('benthos')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Jeffail/benthos/releases/download/v${pkgver}/benthos_${pkgver}_linux_amd64.tar.gz")
sha256sums=('9ab6379c8fc9a0ebd65ee07439358946138713ae31ed5dc591c66929ee8e336c')

package() {
  install -Dm755 "${srcdir}"/benthos "${pkgdir}/usr/bin/benthos"
  install -Dm644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}"/*.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -d "${pkgdir}/etc/"
  cp -aR config "${pkgdir}/etc/${pkgname%-bin}"
}