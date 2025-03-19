# Maintainer: Emanuel Bennici <emanuel at l0nax dot org>
# Contributor: jbpratt <jbpratt78 at gmail dot com>

pkgname=src-cli-bin
pkgver=6.1.0
pkgrel=2
pkgdesc="A command line interface to Sourcegraph"
url="https://github.com/sourcegraph/src-cli"
arch=('x86_64' 'aarch64')
license=('APACHE')
provides=('src-cli')
conflicts=('sourcegraph-cli')

source_x86_64=("https://github.com/sourcegraph/src-cli/releases/download/${pkgver}/src-cli_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/sourcegraph/src-cli/releases/download/${pkgver}/src-cli_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('a3257c5290587b74bcc8e0d9f5dfa4c2050e76f52ecc395e3493ec5101ca958e')
sha256sums_aarch64=('40ae78da26ae72da41363632899594e6b3922557bfb6e5234519a2a47f1d81b3')

package() {
	install -Dm755 "${srcdir}/src" "${pkgdir}/usr/bin/src"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
