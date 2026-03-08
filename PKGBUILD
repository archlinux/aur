pkgname=aspm
pkgver=1.12.3
pkgrel=1
pkgdesc="A secure private messenger"
arch=('x86_64')
url="https://github.com/fredima2x/aspm"
license=('GPL')
depends=(
    'python'
    'python-pyqt5'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/fredima2x/aspm/archive/v$pkgver.tar.gz")
sha256sums=('7009d495734a4294db839e8eedb94b0be9e53b04091cc2fd354974f14d3f598c')

package() {
    cd "$pkgname-$pkgver"
    install -dm755 "$pkgdir/opt/aspm"
    cp -r . "$pkgdir/opt/aspm/"
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/aspm" << 'EOF'
#!/bin/bash
exec python /opt/aspm/main.py "$@"
EOF
}
