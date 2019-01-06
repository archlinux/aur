# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='nfpm'
pkgver=0.9.7
pkgrel=1
pkgdesc='A simple deb and rpm packager written in Go '
url='https://github.com/goreleaser/nfpm'
arch=('x86_64')
license=('MIT')

depends=()
makedepends=()

source=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_${arch}.tar.gz")
sha256sums=('8b515dd6a371962234562d7ba0e43572af43b809de27afd7148d07ffc47f1dea')

package() {
  # Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
  install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
