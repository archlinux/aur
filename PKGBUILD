# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=python-btrfs-heatmap
pkgver=97.e503d3e
pkgrel=1
pkgdesc="Python Btrfs HeatMap"
arch=('any')
url="https://github.com/knorrie/btrfs-heatmap"
license=('GPL3')
depends=('python-btrfs')
source=("$pkgname"::'git://github.com/knorrie/btrfs-heatmap.git#branch=master')
md5sums=('SKIP')

pkgver() {
    cd ${pkgname}
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    cd "$srcdir/${pkgname}/"
    install -Dm755 ./heatmap.py "$pkgdir/usr/bin/btrfs-heatmap"
}
