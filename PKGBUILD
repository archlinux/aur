# Maintainer: Lara Maia <lara@craft.net.br>

pkgname=firefox-vacuum
pkgver=1.1
pkgrel=1
pkgdesc="Script for optimize firefox database"
arch=('any')
url="http://lara.craft.net.br"
license=('GPL')
depends=('sqlite')

source=("http://lara.craft.net.br/$pkgname.sh"
        "$pkgname.service"
        "$pkgname.install")
        
md5sums=('aab7e95b516e1ecf62d3868adcbaafca'
         'c3e55982db31cbd4ffd8905587e8845d'
         '4668361cd676fb04731e7d584f769f7a')

install=$pkgname.install

package() {
    install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
    install -Dm644 $pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname@.service
}

