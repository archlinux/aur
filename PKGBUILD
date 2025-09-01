# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-calc
pkgver=1.0.0
pkgrel=14
pkgdesc='calc provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('libqalculate')
makedepends=('go')
conflicts=('elephant-calc')
provides=('elephant-calc')
source=("${url}/archive/refs/tags/v${pkgver}-beta-14.tar.gz")
sha256sums=('efb24798315be38df2a20a6a9ebd516f627fcb45a755b37cc71bf258fe06e929')

build() {
    cd elephant-${pkgver}-beta-14/internal/providers/calc
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}-beta-14/internal/providers/calc
    install -Dm 755 calc.so -t "${pkgdir}/etc/xdg/elephant/providers"
}
