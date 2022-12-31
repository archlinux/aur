# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>
# Contributor: Ray Del Rosario <michael@raydelrosario.com>
pkgname='kubecolor'
pkgver=0.0.25
pkgrel=4
pkgdesc='Colorize your kubectl output'
url='https://github.com/hidetatz/kubecolor'
arch=('x86_64')
license=('MIT')
depends=('kubectl')
makedepends=('go')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('504c41b15efaa12cd5ff3f9a735b1c68f3476d96559c85b38c5b85289378fe53')

build() {
    cd "${pkgname}-${pkgver}"
    go build -o "$pkgname" ./cmd/kubecolor
}

package() {
    cd "${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
