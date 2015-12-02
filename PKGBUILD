# Maintainer: parazyd <parazyd AT dyne DOT org>
pkgname=gtomb-git
pkgver=0.2
pkgrel=1
pkgdesc="GUI wrapper for Tomb, the crypto undertaker"
arch=('any')
url="https://github.com/parazyd/gtomb"
license=('MIT')
depends=('zsh' 'zenity' 'tomb')
makedepends=('git')
source=('git://github.com/parazyd/gtomb')
sha1sums=('SKIP')

pkgver() {
    cd gtomb
    echo "$(git describe --long --tags | tr - .)"
}

build() {
    cd gtomb
    chmod +x gtomb
}

package() {
    cd gtomb
    mkdir -p $pkgdir/usr/local/bin/
    cp gtomb $pkgdir/usr/local/bin/gtomb
    cp monmort.png $pkgdir/usr/local/bin/monmort.png

    echo -e "Edit /usr/local/bin/gtomb if your tomb executable path is different from /usr/local/bin/tomb"
}
