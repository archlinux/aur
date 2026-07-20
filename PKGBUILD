# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Emanuel Bennici <emanuel at l0nax dot org>
# Contributor: jbpratt <jbpratt78 at gmail dot com>

pkgname=src-cli-bin
pkgver=7.5.0
pkgrel=1
pkgdesc="A command line interface to Sourcegraph"
url="https://github.com/sourcegraph/src-cli"
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
provides=('src')
conflicts=('sourcegraph-cli')

source_x86_64=("https://github.com/sourcegraph/src-cli/releases/download/${pkgver}/src-cli_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/sourcegraph/src-cli/releases/download/${pkgver}/src-cli_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('30634db359407fab304cc0742b0540b07c24dd3545c21ae0014a49c1f5248531')
sha256sums_aarch64=('3864a2f07af8ed9ea9db2c6b087cfaf044b4b175cfa7d41d9df66f9e1dbf3630')

package() {
    install -Dm755 "${srcdir}/src" "${pkgdir}/usr/bin/src"

    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
