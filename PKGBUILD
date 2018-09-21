# Maintainer: xsmile <sascha_r gmx de>

pkgname=myetherwallet
_pkgname=etherwallet
pkgver=3.22.3
pkgrel=1
pkgdesc='Free, open-source, client-side tool for easily & securely interacting with the Ethereum network'
arch=('any')
depends=('xdg-utils')
url='https://github.com/kvhnuke/etherwallet'
license=('MIT')
source=("$url/releases/download/v$pkgver/$_pkgname-v$pkgver.zip"{,.sig}
        'myetherwallet.desktop'
        'myetherwallet'
        'LICENSE')
sha256sums=('0c8fc6a9289136fd9d8b3065f9834f65da32e7734ac8a54d13df4a1869802352'
            'SKIP'
            '08fca55eaa60eca466f75a9961aa792442e36ae6740f31ff9c0dbfa888f9a45f'
            '7f53205c3ee5ca028aa9ef69544de8befdc25670dfbd45203ea8d81539e3ca7e'
            'c834d53db7382f39e38e49e72ca27c79353e3be00e47e40705c2e5b9be964b57')
validpgpkeys=('2FCA4A1E3AF4278F7AD3B7637F059C0F7B9A12F0')

package() {
  cd "$srcdir/$_pkgname-v$pkgver"

  # Lib directory
  install -d "$pkgdir/opt/$pkgname"
  cp -a css fonts images js *.html "$pkgdir/opt/$pkgname"
  # Executable
  install -Dm755 "$srcdir/$pkgname" -t "$pkgdir/usr/bin"

  # License
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
  # Menu entry
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "images/fav/android-chrome-192x192.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
