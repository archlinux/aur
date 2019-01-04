# Maintainer:Lucas Eduardo Wendt <lucas59356@gmail.com>

pkgname=batmon-git
pkgver=v0.2
depends=('python')
makedepends=()
pkgrel=0
arch=(any)
pkgdesc="Monitores the battery level and saves somewhere for future analysis"
license=("custom")
options=(!strip)
url="https://github.com/lucasew/batmon"
install=batmon-git.install
source=("https://github.com/lucasew/batmon/archive/$pkgver.zip")
sha256sums=("a5ec86ee7b7cb38acda2b956b039235d451216d256e225ec9b2d0a5849b3a6f4")

package() {
    mkdir $pkgdir/usr/bin -p
    cp $srcdir/batmon-*/batmond $pkgdir/usr/bin
    chmod +x $pkgdir/usr/bin/batmond
    mkdir $pkgdir/etc/systemd/system -p
    cp $srcdir/batmon-*/batmond.service $pkgdir/etc/systemd/system
}
