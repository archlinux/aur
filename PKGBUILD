# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=ualsv
pkgver=1.7.4
pkgrel=1
epoch=1
pkgdesc='Useful Arch Linux Script Vault'
arch=('any')
url='https://github.com/BiteDasher/ualsv'
license=('MIT')
makedepends=('sed')
depends=('gawk' 'sed' 'coreutils' 'bash' 'wget' 'curl' 'git' 'grep' 'sudo' 'yay' 'patch')
source=("${pkgname}-${pkgver}::https://github.com/BiteDasher/ualsv/archive/${pkgver}.tar.gz")
sha512sums=('9646d3a26b4be0e4869cf4a64b50eb156cfd9b3ad382520396862d3e374e1ae2b1dae04b1b5b5cad2f9ebe7f884ae7d586c66fa9842419d31ef09021dc19e615')
install=ualsv.install
package() {
mkdir -p $pkgdir/usr/bin
mkdir -p $pkgdir/usr/share/ualsv
install -m 755 "$srcdir/$pkgname-$pkgver/ualsv.sh" "$pkgdir/usr/bin/ualsv"
sed 's/LIB="\/usr\/local\/share\/ualsv"/LIB="\/usr\/share\/ualsv"/' -i "$pkgdir/usr/bin/ualsv"
install -m 755 "$srcdir/$pkgname-$pkgver/checkutils.sh" "$pkgdir/usr/share/ualsv/checkutils.sh"
}
