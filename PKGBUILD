# Maintainer: Lara Maia <dev@lara.click>
# Co-Mainteiner: Acidhub <contact@acidhub.click>

pkgname=firefox-vacuum
pkgver=1.1
pkgrel=2
pkgdesc="Script for optimize firefox database"
arch=('any')
url="http://acidhub.click"
license=('GPL')
depends=('sqlite')


source=("$url/downloads/$pkgname.sh"
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

