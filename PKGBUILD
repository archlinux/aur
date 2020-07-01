# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Tammer Ibrahim <t at tammeri dot net>

pkgname=ttf-courier-prime
pkgver=1.203
pkgrel=5
pkgdesc="Monospace Courier font alternative. It’s Courier, just better"
arch=('any')
url='https://quoteunquoteapps.com/courierprime/'
license=('OFL')
source=('https://quoteunquoteapps.com/courierprime/downloads/courier-prime.zip'
        'https://quoteunquoteapps.com/courierprime/downloads/courier-prime-sans.zip'
        'https://quoteunquoteapps.com/courierprime/downloads/courier-prime-code.zip'
        'https://quoteunquoteapps.com/courierprime/downloads/courier-prime-medium-semi-bold.zip')
sha256sums=('d5d4faf1bee0d1f52bab1103cbfdfb354976331c86f999c110c22a098cb12d73'
            '754b3937340f5522ccf96be7832efbd809ef93f373d51b12919adbd9c0a468d7'
            'c400b6addeddef7c26a9943f847a8584c83d8bb775cd35da2dcd41c6ad98d827'
            'b1ec844f4fcdff58cf532e942ec74766bcf38e9c75fc06e1a99a24afedd41ecb')

package() {
  cd "$srcdir"

  # Install fonts
  install -d "$pkgdir/usr/share/fonts/TTF"
  # Courier Prime fonts expand to directory `Courier Prime`
  # Courier Prime Sans fonts expand to directory `CourierPrimeSans-master/ttf`
  # Courier Prime Code fonts expand to directory `ttf`
  # Courier Prime Medium & Semi-Bold fonts expand to base directory
  install -m644 {Courier\ Prime/,CourierPrimeSans-master/ttf/,ttf/,}*.ttf "$pkgdir/usr/share/fonts/TTF"

  # Install licences
  # Courier Prime has two files, Sans has different license, last two have none
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 Courier\ Prime/LICENSE/* "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 CourierPrimeSans-master/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/CourierPrimeSans_LICENSE.md"
}
