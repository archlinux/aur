# Maintainer: edu4rdshl

pkgname=tor-router
pkgver=1.3.0
pkgrel=1
pkgdesc='A tool that allow you to make TOR your default gateway and send all internet connections under TOR (as transparent proxy) for increase privacy/anonymity without extra unnecessary code.'
arch=('any')
url='https://github.com/edu4rdshl/tor-router'
license=('GPL3')
depends=('tor' 'systemd')
optdepends=('curl: to verify if the script run sucessfully.')
install=tor-router.install
source=("https://github.com/Edu4rdSHL/tor-router/archive/$pkgver.tar.gz"
         'tor-router.install')
sha512sums=('3c5d5603a71cec19929caca97b24b82adac5bf4c2787ae89ad21b1f5ac8617db33f6f3cf8c474262e0102171876931cadf962ba7990b6bcb048730ec91384b06'
            '2a0393f2f2c5603b3c9f59c14510121a2e57392b701ba5be9336bd93624ff4e6e50d2338a4f0eeadf07ad1d0d50d8646d1418e418b593baea09a418f9972fac1'
            )

package() {
  cd "$pkgname-$pkgver/files"

  install -Dm 755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 $pkgname.service "$pkgdir/etc/systemd/system/$pkgname.service"
  install -Dm 644 ../README.md "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm 644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

