#!/bin/bash

# Maintainer: Bruno Gouvinhas <$(base64 --decode <<<'YnJ1bm9nb3V2aW5oYXNAZ21haWwuY29tCg==')>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Patrick Lloyd <$(base64 --decode <<<'cGF0cmlja0BsbG95ZC5zaAo=')>

pkgname=marp-cli-bin
pkgver=3.1.0
pkgrel=2
pkgdesc='A CLI interface for Marp and Marpit based converters'
url='https://github.com/marp-team/marp-cli'
arch=('x86_64')
license=('MIT')
depends=('gcc-libs')
conflicts=('marp-cli')
options=('!strip') # Stripping causes "Pkg: Error reading from file."
replaces=('marp')
source=("${url}/releases/download/v${pkgver}/marp-cli-v${pkgver}-linux.tar.gz" "https://raw.githubusercontent.com/marp-team/marp-cli/master/LICENSE")
b2sums=('709c4a4fed879d7e5872f2bed18e7d26d5103845f4adb98a66531749f6557e799edf2d0a777564dec5999d66bc1d853a5758fd74b647024cb0bac3f50c465617'
        'c53efbcec37e21912a9cb464a70839674a6174b577656c738d72e803e53bb0d05050056c9144d1952a2e1db39cad66ce0176d6d17c92fa847e22a20ce98ec596')

package() {
        # There's only a bare binary in the tarball
        install -Dm755 "${srcdir}/marp" "${pkgdir}/usr/bin/marp"
        install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
