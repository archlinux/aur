# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=ualsv
pkgver=1.0
pkgrel=1
epoch=1
pkgdesc='Useful Arch Linux Script Vault'
arch=('any')
url='https://github.com/BiteDasher/ualsv'
license=('MIT')
makedepends=('sed')
depends=('gawk' 'sed' 'coreutils' 'bash' 'wget' 'curl' 'git' 'grep' 'sudo' 'yay')
source=("${pkgname}-${pkgver}::https://github.com/BiteDasher/ualsv/archive/${pkgver}.tar.gz")
sha512sums=('1da2cfd46bb6ef5144d6e4aab874da297cc85cc99e7cf35c4b5eda4401da2e8b3c83bc523614b6f25180448e88079f79ac2f060a6d4dcf0bf24b8637b70b83b5')
install=ualsv.install
package() {
mkdir -p $pkgdir/usr/bin
mkdir -p $pkgdir/usr/share/ualsv
install -m 755 "$srcdir/$pkgname-$pkgver/ualsv.sh" "$pkgdir/usr/bin/ualsv"
sed 's/LIB="\/usr\/local\/share\/ualsv"/LIB="\/usr\/share\/ualsv"/' -i "$pkgdir/usr/bin/ualsv"
install -m 755 "$srcdir/$pkgname-$pkgver/checkutils.sh" "$pkgdir/usr/share/ualsv/checkutils.sh"
}
