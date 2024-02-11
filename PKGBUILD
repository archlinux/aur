#!/bin/bash

# Maintainer: Bruno Gouvinhas <$(base64 --decode <<<'YnJ1bm9nb3V2aW5oYXNAZ21haWwuY29tCg==')>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Patrick Lloyd <$(base64 --decode <<<'cGF0cmlja0BsbG95ZC5zaAo=')>

pkgname=marp-cli-bin
pkgver=3.4.0
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
b2sums=('8194ee3e5924a97719064ad2c7061d5d567ed5513044394d7767860b2a1f87a782e52c9d9bbaa5ce9c55f4ea367af0026dacfceb40c52c62c93a345ad078fad1'
        '016073d59841c8f0cdb38a3f4f7a5481a2737c6e4db7ed5acbef3f3a2daa3ae6860d2081125e2a11fc526cfb527c7d7d131c0179c99ab3f79eae75adb1b949de')

package() {
        # There's only a bare binary in the tarball
        install -Dm755 "${srcdir}/marp" "${pkgdir}/usr/bin/marp"
        install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
