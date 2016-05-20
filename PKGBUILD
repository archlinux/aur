# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=ananicy-git
pkgver=43.0bfbe9d
pkgrel=1
pkgdesc="Ananicy - is Another auto nice daemon, with community rules support"
arch=('any')
url="https://github.com/Nefelim4ag/Ananicy.git"
license=('GPL3')
depends=('systemd' 'bash')
source=("$pkgname"::'git://github.com/Nefelim4ag/Ananicy.git#branch=master')
md5sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd ${pkgname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    mkdir -p        "$pkgdir"/etc/
    mv              "$srcdir"/$pkgname/ananicy.d        "$pkgdir"/etc/
    install -Dm644  "$srcdir"/$pkgname/ananicy.service  "$pkgdir"/usr/lib/systemd/system/ananicy.service
    install -Dm755  "$srcdir"/$pkgname/ananicy.sh       "$pkgdir"/usr/lib/systemd/scripts/ananicy.sh
}
