#!/bin/bash

# Maintainer: Bruno Gouvinhas <$(base64 --decode <<<'YnJ1bm9nb3V2aW5oYXNAZ21haWwuY29tCg==')>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Patrick Lloyd <$(base64 --decode <<<'cGF0cmlja0BsbG95ZC5zaAo=')>

pkgname=marp-cli-bin
pkgver=4.0.3
pkgrel=1
pkgdesc='A CLI interface for Marp and Marpit based converters'
url='https://github.com/marp-team/marp-cli'
arch=('x86_64')
license=('MIT')
depends=('gcc-libs')
conflicts=('marp-cli')
options=('!strip') # Stripping causes "Pkg: Error reading from file."
replaces=('marp')
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/marp-cli-v${pkgver}-linux.tar.gz"
    "${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/marp-team/marp-cli/v${pkgver}/LICENSE"
)
b2sums=(
    '9debd7a1142bb9da44199c53f7ddd9e2d8be1839a0f038fa7ad6b1820d35222fcfbaea45cb7c721c0f1f1914869177761483ac7f7e5abf45452235da9cb788cb'
    'c53efbcec37e21912a9cb464a70839674a6174b577656c738d72e803e53bb0d05050056c9144d1952a2e1db39cad66ce0176d6d17c92fa847e22a20ce98ec596'
)

package() {
        # There's only a bare binary in the tarball
        install -Dm755 "${srcdir}/marp" "${pkgdir}/usr/bin/marp"
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
