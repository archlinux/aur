# Maintainer: tjbp (archlinux@tjbp.net)

pkgname='otf-openbaskerville'
pkgver='0.1.0'
pkgrel='3'
pkgdesc="An open source implementation of Fry's Baskerville, a Baskerville derivative by Isaac Moore"
arch=('any')
url="http://klepas.org/openbaskerville/"
license=('custom:OFL')
makedepends=('ufo2otf' 'eot-utilities')
depends=('fontconfig' 'xorg-font-utils')
install='otf.install'
source=("https://github.com/klepas/open-baskerville/archive/v0.0.0.zip")
sha256sums=('557dced5e5e0e263d4d9fa311619d86a19bad6275c685053dbf8192e8e90f6ef')

build() {
    ufo2otf ${srcdir}/open-baskerville-0.0.0/OpenBaskerville.ufo
}

package() {
    # Font installation
    install -Dm0644 "$srcdir/open-baskerville-0.0.0/OpenBaskerville.otf" "$pkgdir/usr/share/fonts/OTF"

    # Licence installation
    install -Dm0644 "$srcdir/open-baskerville-0.0.0/COPYING-OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
