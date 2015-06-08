# $Id$
# Maintainer: Justin Settle <jus10 at partlycloudy dot org>

pkgname=ttf-carlito
pkgver=20130920
pkgrel=1
pkgdesc='Googles Carlito font'
arch=('any')
license=('custom:OFL')
url='https://code.google.com/p/chromium/issues/detail?id=280557'
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
provides=('ttf-font')
install=ttf.install
source=("http://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/crosextrafonts-carlito-$pkgver.tar.gz"
        30-0-carlito.conf)
md5sums=('c74b7223abe75949b4af367942d96c7a'
         '175d57bd2f40045df180a7dc18e2d513')

package() {
  cd "$srcdir/crosextrafonts-carlito-$pkgver"

  install -d "$pkgdir/usr/share/fonts/TTF/"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"

  # install fontconfig files
  install -Dm0644 ../30-0-carlito.conf "$pkgdir/etc/fonts/conf.avail/30-carlito.conf"

  # install license
  install -Dm644 "${srcdir}/crosextrafonts-carlito-$pkgver/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
