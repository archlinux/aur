# Maintainer: coderkun <olli@suruatoel.xyz

pkgname=kbd-neo
pkgver=4
pkgrel=1
pkgdesc="NEO 2 terminal keyboard layout"
arch=('any')
url="https://www.neo-layout.org/"
license=('CC-BY-SA')
depends=('kbd')
source=(https://git.neo-layout.org/neo/neo-layout/raw/branch/master/linux/console/neo.map)
sha256sums=('f9ae14b0e52248bfe628b895d85ccbe5eda580885ebff7991c3c6d69ef81eab9')

build() {
    cd $srcdir
    gzip -f neo.map
}

package() {
    cd $srcdir
    install -m 664 -D neo.map.gz $pkgdir/usr/share/kbd/keymaps/i386/qwertz/neo.map.gz
}
