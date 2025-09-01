# Maintainer: TheOddCell <rayfb.to.1@gmail.com>
pkgname=oshd
pkgver=2.1.1
pkgrel=3
pkgdesc="Odd Static Hosts Daemon"
arch=('any')
url="https://github.com/TheOddCell/oshd"
license=('MIT')
depends=('python3' 'systemd')
makedepends=()
source=("https://github.com/TheOddCell/oshd/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')
provides=('oshctl')

package() {
    cd "$srcdir/oshd-$pkgver"
    install -Dm755 oshctl.py "$pkgdir/usr/bin/oshctl"
    install -Dm755 oshd.py "$pkgdir/usr/bin/oshd"
    install -Dm644 oshd.service "$pkgdir/etc/systemd/system/oshd.service"
}
