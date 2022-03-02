#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Patrick Lloyd <$(base64 --decode <<<'cGF0cmlja0BsbG95ZC5zaAo=')>

pkgname=marp-cli-bin
pkgver=1.7.0
pkgrel=1
pkgdesc='A CLI interface for Marp and Marpit based converters'
url='https://github.com/marp-team/marp-cli'
arch=('x86_64')
license=('MIT')
depends=('gcc-libs')
conflicts=('marp-cli')
options=('!strip') # Stripping causes "Pkg: Error reading from file."
replaces=('marp')
source=("${url}/releases/download/v${pkgver}/marp-cli-v${pkgver}-linux.tar.gz" "https://raw.githubusercontent.com/marp-team/marp-cli/master/LICENSE")
b2sums=('ca492e30bad81b3c5ffd6b54d83f420bc2171701879bb16f891d67791bee9fd299ab73e21bd25fb479adf591d60cbacac11af331017dd397fb56e8526f4bb65a'
        'c53efbcec37e21912a9cb464a70839674a6174b577656c738d72e803e53bb0d05050056c9144d1952a2e1db39cad66ce0176d6d17c92fa847e22a20ce98ec596')

package() {
        # There's only a bare binary in the tarball
        install -Dm755 "${srcdir}/marp" "${pkgdir}/usr/bin/marp"
        install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
