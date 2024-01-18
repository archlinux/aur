# Maintainer: edu4rdshl

pkgname=tor-router
pkgver=1.5.3
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
sha512sums=('9d24a34a6b3b851ed39f9b6c4d80b4fa6c4a3c3d920bd9b730bcb19c6202de01a014b9c7d6bd5c9eda2500442f5a707217632b930dd1de50fb8c4e2546434a55'
            'd16087be8fa2129df3614617f16dd22312748b0c88af5a962ab269f1a5d4e225538ba8f2aa47ce935c4013d47ffa5cb4ae46470b88adc27beb464e73901b0bda')

package() {
  cd "$pkgname-$pkgver/files"

  install -Dm 755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 $pkgname.service "$pkgdir/etc/systemd/system/$pkgname.service"
  install -Dm 644 ../README.md "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm 644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

