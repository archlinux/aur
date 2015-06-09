# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=colorcore
pkgver=1.3
pkgrel=1
pkgdesc="The Open Assets client for colored coins"
arch=('any')
depends=('python'
         'python-aiohttp'
         'python-openassets'
         'python-python-bitcoinlib')
optdepends=('bitcoin-core: retrieve information from the blockchain')
url="https://github.com/OpenAssets/colorcore"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/OpenAssets/$pkgname/tar.gz/v$pkgver
        colorcore.sh)
sha256sums=('84ec0a7b32502235d8b137f954154f427baf5021030260f7b54a7b5ee33266fb'
            'c5a724afff0e11865a355498c8748d8b9b1e313cfb9f49d76e7d6ce3126c63d1')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/colorcore" "$pkgdir/usr/bin"
  find . -mindepth 1 -maxdepth 1 -exec \
    cp -dpr --no-preserve=ownership '{}' "$pkgdir/usr/share/colorcore" \;
  install -Dm 755 "$srcdir/colorcore.sh" "$pkgdir/usr/bin/colorcore"
}
