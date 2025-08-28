# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-providerlist
pkgver=1.0.0
pkgrel=8
pkgdesc='providerlist provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('go')
conflicts=('elephant-providerlist')
provides=('elephant-providerlist')
source=("${url}/archive/refs/tags/v${pkgver}-beta-8.tar.gz")
sha256sums=('9b3d5d300dd9b1b5ded7a4f520f70fb91c066602ec11bab433dd250917a12dce')

build() {
    cd elephant-${pkgver}-beta-8/internal/providers/providerlist
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}-beta-8/internal/providers/providerlist
    install -Dm 755 providerlist.so -t "${pkgdir}/etc/xdg/elephant/providers"
}
