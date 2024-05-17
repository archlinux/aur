# Maintainer: Emanuel Bennici <emanuel at l0nax dot org>
# Contributor: jbpratt <jbpratt78 at gmail dot com>

pkgname=src-cli-bin
pkgver=5.4.0
pkgrel=1
pkgdesc="A command line interface to Sourcegraph"
url="https://github.com/sourcegraph/src-cli"
arch=('x86_64' 'aarch64')
license=('APACHE')
provides=('src-cli')
conflicts=('sourcegraph-cli')

source_x86_64=("https://github.com/sourcegraph/src-cli/releases/download/${pkgver}/src-cli_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/sourcegraph/src-cli/releases/download/${pkgver}/src-cli_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('ff98b54b0cf36c730bbf511c45732420aa069f87d3acb4b2710eb3ad5aa459a4')
sha256sums_aarch64=('3534cb2af85ecdc818f4f2da4fcaf0478024ce2af3ad851b236efba0db81aaae')

package() {
	install -Dm755 "${srcdir}/src" "${pkgdir}/usr/bin/src"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
