# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=ualsv
pkgver=1.3
pkgrel=1
epoch=1
pkgdesc='Useful Arch Linux Script Vault'
arch=('any')
url='https://github.com/BiteDasher/ualsv'
license=('MIT')
makedepends=('sed')
depends=('gawk' 'sed' 'coreutils' 'bash' 'wget' 'curl' 'git' 'grep' 'sudo' 'yay' 'patch')
source=("${pkgname}-${pkgver}::https://github.com/BiteDasher/ualsv/archive/${pkgver}.tar.gz")
sha512sums=('a0f63f4efe855724c450ae2c176d874c0ab54a172749b8ff5339e446fa52fbbf46489725ea12b976b736ca221869dd7dc228052d92beeb47641e85234bf74546')
install=ualsv.install
package() {
mkdir -p $pkgdir/usr/bin
mkdir -p $pkgdir/usr/share/ualsv
install -m 755 "$srcdir/$pkgname-$pkgver/ualsv.sh" "$pkgdir/usr/bin/ualsv"
sed 's/LIB="\/usr\/local\/share\/ualsv"/LIB="\/usr\/share\/ualsv"/' -i "$pkgdir/usr/bin/ualsv"
install -m 755 "$srcdir/$pkgname-$pkgver/checkutils.sh" "$pkgdir/usr/share/ualsv/checkutils.sh"
}
