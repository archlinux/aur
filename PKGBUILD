# Maintainer: Emanuel Bennici <emanuel at l0nax dot org>
# Contributor: jbpratt <jbpratt78 at gmail dot com>

pkgname=src-cli-bin
pkgver=5.3.0
pkgrel=1
pkgdesc="A command line interface to Sourcegraph"
url="https://github.com/sourcegraph/src-cli"
arch=('x86_64' 'aarch64')
license=('APACHE')
provides=('src-cli')
conflicts=('sourcegraph-cli')

source_x86_64=("https://github.com/sourcegraph/src-cli/releases/download/${pkgver}/src-cli_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/sourcegraph/src-cli/releases/download/${pkgver}/src-cli_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('417a4329b0abf557a5fc36eedb626c53aaf886e48a49a594d98c095beaba0d02')
sha256sums_aarch64=('72dcf9a9ecd91dbdceecea1feb2b552b252fc661053a482be56d41c8878f691a')

package() {
	install -Dm755 "${srcdir}/src" "${pkgdir}/usr/bin/src"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
