pkgname=aspm
pkgver=1.0.0
pkgrel=1
pkgdesc="A secure private messenger"
arch=('x86_64')
url="https://github.com/fredima2x/aspm"
license=('MIT')
depends=(
    'python'
    'python-pyqt5'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/fredima2x/aspm/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$pkgname-$pkgver"
    install -dm755 "$pkgdir/opt/aspm"
    cp -r . "$pkgdir/opt/aspm/"
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/aspm" << 'SCRIPT'
#!/bin/bash
exec python /opt/aspm/main.py "$@"
SCRIPT
}
