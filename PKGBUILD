# Maintainer: Emanuel Bennici <emanuel at l0nax dot org>
# Contributor: jbpratt <jbpratt78 at gmail dot com>

pkgname=src-cli-bin
pkgver=6.5.0
pkgrel=1
pkgdesc="A command line interface to Sourcegraph"
url="https://github.com/sourcegraph/src-cli"
arch=('x86_64' 'aarch64')
license=('APACHE')
provides=('src-cli')
conflicts=('sourcegraph-cli')

source_x86_64=("https://github.com/sourcegraph/src-cli/releases/download/${pkgver}/src-cli_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/sourcegraph/src-cli/releases/download/${pkgver}/src-cli_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('ae0e351c80b4f89ad0990e0d993987d717eb83a6afb23f62ca16b353efce3e42')
sha256sums_aarch64=('8b2663c42f65934f75b4e09544e4dd111ea033e7492f287486ec70b5ad6415c3')

package() {
  install -Dm755 "${srcdir}/src" "${pkgdir}/usr/bin/src"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
