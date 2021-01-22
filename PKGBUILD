# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=ualsv
pkgver=1.4
pkgrel=1
epoch=1
pkgdesc='Useful Arch Linux Script Vault'
arch=('any')
url='https://github.com/BiteDasher/ualsv'
license=('MIT')
makedepends=('sed')
depends=('gawk' 'sed' 'coreutils' 'bash' 'wget' 'curl' 'git' 'grep' 'sudo' 'yay' 'patch')
source=("${pkgname}-${pkgver}::https://github.com/BiteDasher/ualsv/archive/${pkgver}.tar.gz")
sha512sums=('a163001599e5ed9d96246df588d05a70aef3e4c9962f26b05f861817ecb0031e25e5858d7c138f81141d6fe2dcba6e07afb4511375d2001da2cda2309289b2ea')
install=ualsv.install
package() {
mkdir -p $pkgdir/usr/bin
mkdir -p $pkgdir/usr/share/ualsv
install -m 755 "$srcdir/$pkgname-$pkgver/ualsv.sh" "$pkgdir/usr/bin/ualsv"
sed 's/LIB="\/usr\/local\/share\/ualsv"/LIB="\/usr\/share\/ualsv"/' -i "$pkgdir/usr/bin/ualsv"
install -m 755 "$srcdir/$pkgname-$pkgver/checkutils.sh" "$pkgdir/usr/share/ualsv/checkutils.sh"
}
