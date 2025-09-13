#!/bin/bash

# Maintainer: Tokenicrat <hi@bytoken.link>

pkgname=marp-cli-bin
pkgver=4.2.3
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
    'ddced851973220322b681e1a17e6bc786ce0d40389e3ad3235e77b565a82697d0ca8aef88b2fb038c0dac9d0e03b1e6da789431615029826a94032d273033d6b'
    'c53efbcec37e21912a9cb464a70839674a6174b577656c738d72e803e53bb0d05050056c9144d1952a2e1db39cad66ce0176d6d17c92fa847e22a20ce98ec596'
)

package() {
        # There's only a bare binary in the tarball
        install -Dm755 "${srcdir}/marp" "${pkgdir}/usr/bin/marp"
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

