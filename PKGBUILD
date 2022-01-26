#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Patrick Lloyd <$(base64 --decode <<<'cGF0cmlja0BsbG95ZC5zaAo=')>

pkgname=marp-cli-bin
pkgver=1.5.2
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
b2sums=('379d47b446c386b3b889db9da98794e59d5f093bf68e8ddefb1d7d0501171a55fee9588fbc96f989ff34f0bfd3fb9838d98c0295c1e3259064e856b370d0170d'
        'c53efbcec37e21912a9cb464a70839674a6174b577656c738d72e803e53bb0d05050056c9144d1952a2e1db39cad66ce0176d6d17c92fa847e22a20ce98ec596')

package() {
        # There's only a bare binary in the tarball
        install -Dm755 "${srcdir}/marp" "${pkgdir}/usr/bin/marp"
        install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
