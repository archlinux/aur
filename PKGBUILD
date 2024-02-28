# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=remarkable-cups
pkgver=1
pkgrel=1
pkgdesc="CUPS backend that uses rmapi to print files to the remarkable cloud"
url="https://github.com/ofosos/scratch/tree/master/remarkable-cups"
arch=('any')
license=('custom')
depends=('cups' 'poppler' 'ghostscript' 'rmapi')
source=(remarkable.drv remarkable.sh)
sha256sums=('384e5041125b2b15aeb7aeab8bb46c4e09debd4401205640e61010cb792e5e19'
            '306d4d7a1bc19cbcc53e7e7d202f3093893c8b46f140f90701236104a454560b')

build() {
    ppdc remarkable.drv
}

package() {
    install -Dm0644 ppd/remarkable.ppd "$pkgdir"/usr/share/cups/model/remarkable.ppd
    install -Dm0755 remarkable.sh "$pkgdir"/usr/lib/cups/backend/remarkable
}
