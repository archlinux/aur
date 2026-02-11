# Maintainer: Atif Chowdhury <iftakhar dot awal at gmail dot com>

# shellcheck disable=SC2034,SC2154,SC2164

pkgname=ttf-hind-siliguri
pkgver=1.0.0
pkgrel=1
pkgdesc="Hind Siliguri, a Bangla typeface font family"
url='https://github.com/bdeshi/Hind-Siliguri'
arch=('any')
license=('OFL')
depend=('fontconfig')
makedepends=('unzip')
source=('fonts.zip::https://github.com/bdeshi/Hind-Siliguri/archive/247a09fb574ba113068300e7118baab0daa2ad21.zip')
sha256sums=('1bc4f76d9715974c47cf73fbb00d6954c1ecbab1a7c9a752aa453bc00fb383bf')

prepare() {
    unzip -o "$srcdir/fonts.zip" -d "$srcdir"
}

package() {
    install -Dm644 "$srcdir"/Hind-Siliguri-*/TTF/*.ttf -t "$pkgdir/usr/share/fonts/TTF/"
    install -Dm644 "$srcdir"/Hind-Siliguri-*/LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
