# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>
# Contributor: Ray Del Rosario <michael@raydelrosario.com>
pkgname='kubecolor'
pkgver=0.2.2
pkgrel=1
pkgdesc='Colorize your kubectl output'
url='https://github.com/kubecolor/kubecolor'
arch=('x86_64')
license=('MIT')
depends=('kubectl')
makedepends=('go')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ba0894a8e26fefff47a0691529964303bdd8fdc2d7ce74e7d241cb5a2f2ade50')

build() {
  cd "${pkgname}-${pkgver}"
  go build -o "$pkgname" main.go
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
