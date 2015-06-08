# $Id$
# Maintainer: Justin Settle <jus10 at partlycloudy dot org>

pkgname=ttf-caladea
pkgver=20130214
pkgrel=1
pkgdesc='Googles Caladea font'
arch=('any')
license=('Apache')
url='https://code.google.com/p/chromium/issues/detail?id=168879'
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
provides=('ttf-font')
install=ttf.install
source=("http://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/crosextrafonts-$pkgver.tar.gz"
        30-0-caladea.conf)
md5sums=('368f114c078f94214a308a74c7e991bc'
         'ae22e3930249cb665bf626041596756b')

package() {
  cd "$srcdir/crosextrafonts-$pkgver"

  install -d "$pkgdir/usr/share/fonts/TTF/"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"

  # install fontconfig files
  install -Dm0644 ../30-0-caladea.conf "$pkgdir/etc/fonts/conf.avail/30-caladea.conf"
}
