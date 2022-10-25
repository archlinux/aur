# Maintainer: onedwide <one-d-wide@protonmail.com>
pkgname=systemd-hosts.d
pkgver=1.0
pkgrel=1
pkgdesc='Keep your hosts records in logically separated files'
url='https://github.com/one-d-wide/systemd-hosts.d'
arch=('any')
license=(GPL3)
depends=('filesystem' 'systemd')
install=$pkgname.install

source=("$pkgname.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6777c25be3308cdf926e57b5de0f5710dea55679360c2aa99cac03d23d7cd972')

package() {
    cd "$pkgname-$pkgver"
    mkdir -pm755 "$pkgdir/etc/hosts.d"
    install -Dm644 systemd-hosts.d.{path,service} -t "$pkgdir"/usr/lib/systemd/system
}
