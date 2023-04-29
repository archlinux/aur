# Maintainer: edu4rdshl

pkgname=tor-router
pkgver=1.5.2
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
sha512sums=('49e54b04e1b777375daaede71cb76692c6be131f6ffabb8b28983fadd1798c5be12f022887f68f159c63e6c906475d260ce2f756aa8ec8a49228bf2e5112db17'
            '043ae270b9153a8115f46058e369f2d461a5f34891264eed1a5daad444bb15210fd4c6a35b6cfc1c531e378d1fb7e238079baddc2b6e299c60360ec91e61718f')

package() {
  cd "$pkgname-$pkgver/files"

  install -Dm 755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 $pkgname.service "$pkgdir/etc/systemd/system/$pkgname.service"
  install -Dm 644 ../README.md "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm 644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

