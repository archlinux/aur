# Maintainer: xsmile <sascha_r gmx de>

pkgname=myetherwallet
pkgver=3.11.3.0
pkgrel=1
pkgdesc='Free, open-source, client-side tool for easily & securely interacting with the Ethereum network'
arch=('any')
depends=('xdg-utils')
url='https://github.com/kvhnuke/etherwallet'
license=('MIT')
source=("$url/releases/download/v$pkgver/etherwallet-v$pkgver.zip"
        'myetherwallet.desktop'
        'myetherwallet'
        'LICENSE')
md5sums=('de29b1ce27f1b087d66ef366d12f48af'
         '7ede310a5ce49d1e13aaafdf486324d2'
         '812af8159b21a3895a9dd5ed6621c912'
         '1d90c6c90650a922d22d50bdc0194e89')

package() {
  cd "$srcdir/etherwallet-v$pkgver"

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
