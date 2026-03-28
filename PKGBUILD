# shellcheck shell=bash
# shellcheck disable=SC2034
# Maintainer: Chinmay Dalal <~chinmay/public-inbox@lists.sr.ht>

declare srcdir pkgdir
pkgname=ttf-ioskeley-mono
_pkgver=2.0.0-beta.1
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc=" Iosevka configuration to mimic the look and feel of Berkeley Mono as closely as possible"
arch=(any)
url="https://github.com/ahatem/IoskeleyMono"
license=('OFL-1.1')
options=(!strip)
source=("$pkgname-$pkgver-normal.zip::${url}/releases/download/v${_pkgver}/IoskeleyMono-Normal.zip"
    "$pkgname-$pkgver-condensed.zip::${url}/releases/download/v${_pkgver}/IoskeleyMono-Condensed.zip"
    "$pkgname-$pkgver-semicondensed.zip::${url}/releases/download/v${_pkgver}/IoskeleyMono-SemiCondensed.zip"
    "LICENSE::https://raw.githubusercontent.com/ahatem/IoskeleyMono/refs/tags/v${_pkgver}/LICENSE")
sha256sums=('00693cd2ce76e93fccc357b0357a92b5ec2e17fa3cd994e67355baafbe98f8b7'
    '264b5569844c12328b99f1dfb57cb527fe4be2650dd5c15a2333db64a322e6a7'
    'a4dc4d0801892922e7b3572e69bd8c6f0aa0364da436c64fdcb3e1c21b74bdbc'
    '1084285bd2bddf706d566e11a92fcbae2706da4a8eafac49ed34c871d01fb7fe')

package() {
    install -vDm644 -t "$pkgdir/usr/share/fonts/TTF" Hinted/*.ttf
    install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

# vim:set ts=4 sw=4 et:
