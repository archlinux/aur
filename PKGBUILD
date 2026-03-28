#!/bin/bash

# Maintainer: agony <27015 at riseup dot net>
# Contributor: Tokenicrat <hi@bytoken.link>

pkgname=marp-cli-bin
pkgver=4.3.1
pkgrel=2
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
b2sums=('d01b92a6a910c612bcd1d70cf15e7fa8106ee545376ef72327ee7c4e367c1b99a1d240df51f439e554c6353a6a65a9f1554d1a88f256599efb8a3ec2ffe285d8'
        'c53efbcec37e21912a9cb464a70839674a6174b577656c738d72e803e53bb0d05050056c9144d1952a2e1db39cad66ce0176d6d17c92fa847e22a20ce98ec596')

package() {
        # There's only a bare binary in the tarball
        install -Dm755 "${srcdir}/marp" "${pkgdir}/usr/bin/marp"
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

