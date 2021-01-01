# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=benthos-bin
pkgver=3.36.0
pkgrel=1
pkgdesc="A stream processor for mundane tasks written in Go"
arch=('x86_64')
url='https://benthos.dev'
depends=('glibc')
license=('MIT')
provides=('benthos')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Jeffail/benthos/releases/download/v${pkgver}/benthos_${pkgver}_linux_amd64.tar.gz")
sha256sums=('2a4c48b32d7d64830de08cdcc4e8d655c4db918db0140e92215edf64be32085b')

package() {
  install -Dm755 "${srcdir}"/benthos "${pkgdir}/usr/bin/benthos"
  install -Dm644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}"/*.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -d "${pkgdir}/etc/"
  cp -aR config "${pkgdir}/etc/${pkgname%-bin}"
}
