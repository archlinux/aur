# Maintainer: edu4rdshl

pkgname=tor-router
pkgver=1.5.1
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
sha512sums=('b8917cb1d3a83546757624c6d5be06062a244a3b85d4838213c60a0fde6ebf24e965f8932f628b6cc38131097eeef53019f0babe5c85a69fab4c800a3f59f408'
            '043ae270b9153a8115f46058e369f2d461a5f34891264eed1a5daad444bb15210fd4c6a35b6cfc1c531e378d1fb7e238079baddc2b6e299c60360ec91e61718f')

package() {
  cd "$pkgname-$pkgver/files"

  install -Dm 755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 $pkgname.service "$pkgdir/etc/systemd/system/$pkgname.service"
  install -Dm 644 ../README.md "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm 644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

