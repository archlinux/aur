# Maintainer: jerry73204 <jerry73204@gmail.com>
pkgname=rabbitio
pkgver=0.5.4
pkgrel=1
pkgdesc='RabbitIO is used to move data in and out of RabbitMQ'
arch=('any')
url='https://github.com/meltwater/rabbitio'
license=('Apache')
depends=()
makedepends=('go-pie')
source=("https://github.com/meltwater/rabbitio/archive/v${pkgver}.zip")
sha256sums=('2bef052f8a8f490994df73a9926bf178a4f58dfe03573dc2798244c28a509cea')

build() {
  cd "${pkgname}-${pkgver}"

  go build \
    -trimpath \
    -ldflags "-extldflags ${LDFLAGS}" \
    -o "${pkgname}" \
    .
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
