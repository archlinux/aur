# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-websearch
pkgver=1.0.0
pkgrel=21
pkgdesc='websearch provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('go')
conflicts=('elephant-websearch')
provides=('elephant-websearch')
source=("${url}/archive/refs/tags/v${pkgver}-beta-21.tar.gz")
sha256sums=('0f144476574350e1fe48e0ae7368cdb03f658567d791b4d7f601f20815f8b4e9')

build() {
    cd elephant-${pkgver}-beta-21/internal/providers/websearch
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}-beta-21/internal/providers/websearch
    install -Dm 755 websearch.so -t "${pkgdir}/etc/xdg/elephant/providers"
}
