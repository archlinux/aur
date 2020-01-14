# Maintainer: Sotiris Lamprinidis <sot.lampr at gmail dot com>

pkgname=ttf-cavafy-script
pkgver=1.1
pkgrel=0
pkgdesc="Typeface based on the calligraphic style of the alexandrian poet C. P. Cavafy"
arch=('any')
url="https://www.onassis.org/initiatives/cavafy-archive/cavafy-script"
license=('custom:cc-by-nc-nd-4.0')
depends=('fontconfig' 'xorg-font-utils')
provides=('ttf-cavafy-script' 'ttf-font')
source=('https://github.com/onassis-org/cavafy-script/archive/v1.1.zip'
        'https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode.txt')
md5sums=('3769277f4d1c2cab7749496d6cb8adff'
         'c70f85fe39eb601f25b595299c688bfd')

package() {
  install -dm755 "$pkgdir/usr/share/fonts/TTF"

  install -m644 "$srcdir/cavafy-script-1.1/OpenType-TT/CavafyScriptTT.ttf" \
    "$pkgdir/usr/share/fonts/TTF/CavafyScriptTT.ttf"

  install -Dm644 legalcode.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

post_install () {
  fontconfig
}
