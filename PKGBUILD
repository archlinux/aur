# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Chinmay Dalal <TILDE chinmay SLASH public-inbox AT lists.sr.ht>

declare srcdir pkgdir
pkgname=ttf-ioskeley-mono
pkgver=2.0.0
pkgrel=1
pkgdesc=" Iosevka configuration to mimic the look and feel of Berkeley Mono as closely as possible"
arch=(any)
url="https://github.com/ahatem/IoskeleyMono"
license=('OFL-1.1')
options=(!strip)
source=("$pkgname-$pkgver-normal.zip::${url}/releases/download/v${pkgver}/IoskeleyMono.zip"
    "$pkgname-$pkgver-condensed.zip::${url}/releases/download/v${pkgver}/IoskeleyMono-Term.zip"
    "$pkgname-$pkgver-semicondensed.zip::${url}/releases/download/v${pkgver}/IoskeleyMono-NL.zip"
    "LICENSE::https://raw.githubusercontent.com/ahatem/IoskeleyMono/refs/tags/v${pkgver}/LICENSE")
sha256sums=('dc37763fbb82cbb99611955ee3196c774c164c716c0f659b4bddbe3d370c3204'
            'af34aa4f02a6887bc9c7826528a109f054f77edc780ce11d9edd99e32d5a9645'
            '8480dbadb0c8c1739f338aba119dbc359b5d23f45bd1679e018964a77c602a8f'
            '1084285bd2bddf706d566e11a92fcbae2706da4a8eafac49ed34c871d01fb7fe')

package() {
    install -vDm644 -t "$pkgdir/usr/share/fonts/TTF" {Condensed,SemiCondensed,Normal}/Hinted/*.ttf
    install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

# vim:set ts=4 sw=4 et:
