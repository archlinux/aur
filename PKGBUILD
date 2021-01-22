# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=ualsv
pkgver=1.4
pkgrel=2
epoch=1
pkgdesc='Useful Arch Linux Script Vault'
arch=('any')
url='https://github.com/BiteDasher/ualsv'
license=('MIT')
makedepends=('sed')
depends=('gawk' 'sed' 'coreutils' 'bash' 'wget' 'curl' 'git' 'grep' 'sudo' 'yay' 'patch')
source=("${pkgname}-${pkgver}::https://github.com/BiteDasher/ualsv/archive/${pkgver}.tar.gz")
sha512sums=('b25e2e822010bbb64421c5749a8bc5f5a3242eda2cf1ab507cf8bdf9ec1af9c23b70feec88693b72e541332f4af5e0cfd7eca33668c54d182f36bc39a988ca31')
install=ualsv.install
package() {
mkdir -p $pkgdir/usr/bin
mkdir -p $pkgdir/usr/share/ualsv
install -m 755 "$srcdir/$pkgname-$pkgver/ualsv.sh" "$pkgdir/usr/bin/ualsv"
sed 's/LIB="\/usr\/local\/share\/ualsv"/LIB="\/usr\/share\/ualsv"/' -i "$pkgdir/usr/bin/ualsv"
install -m 755 "$srcdir/$pkgname-$pkgver/checkutils.sh" "$pkgdir/usr/share/ualsv/checkutils.sh"
}
