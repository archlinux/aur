# Maintainer: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Tammer Ibrahim <t at tammeri dot net>

pkgname=ttf-courier-prime
pkgver=1.203
pkgrel=2
pkgdesc="Monospace Courier font alternative optimized for screenplays"
arch=('any')
url='http://quoteunquoteapps.com/courierprime/'
license=('custom')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=('http://quoteunquoteapps.com/downloads/courier-prime.zip'
        'http://quoteunquoteapps.com/downloads/courier-sans.zip'
        'http://quoteunquoteapps.com/downloads/courier-code.zip')
sha256sums=('d5d4faf1bee0d1f52bab1103cbfdfb354976331c86f999c110c22a098cb12d73'
            '754b3937340f5522ccf96be7832efbd809ef93f373d51b12919adbd9c0a468d7'
            'c400b6addeddef7c26a9943f847a8584c83d8bb775cd35da2dcd41c6ad98d827')

package() {
  cd "$srcdir/ttf"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF"
  cd "$srcdir/CourierPrimeSans-master/ttf"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF"
  cd "$srcdir/Courier Prime"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 LICENSE/* "$pkgdir/usr/share/licenses/$pkgname"
}
