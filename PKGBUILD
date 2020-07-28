# Maintainer: edu4rdshl

pkgname=tor-router
pkgver=1.4.1
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
sha512sums=('5a04a3496b7618cd7f30825651cbfbd71027823961c2a46c0a653150abcbc35a9631ad2db01fe279577e157bee86e4fe0f5c31a15de6b1cbc141fbac1b9def3d'
            '2a0393f2f2c5603b3c9f59c14510121a2e57392b701ba5be9336bd93624ff4e6e50d2338a4f0eeadf07ad1d0d50d8646d1418e418b593baea09a418f9972fac1'
            )

package() {
  cd "$pkgname-$pkgver/files"

  install -Dm 755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 $pkgname.service "$pkgdir/etc/systemd/system/$pkgname.service"
  install -Dm 644 ../README.md "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm 644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

