# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-unicode
pkgver=1.0.0
pkgrel=23
pkgdesc='unicode provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('go')
conflicts=('elephant-unicode')
provides=('elephant-unicode')
source=("${url}/archive/refs/tags/v${pkgver}-beta-23.tar.gz")
sha256sums=('7496af78c6a535a6410abc9f712a7e9331908a7055bdb42335b653aa9acefdbd')

build() {
    cd elephant-${pkgver}-beta-23/internal/providers/unicode
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}-beta-23/internal/providers/unicode
    install -Dm 755 unicode.so -t "${pkgdir}/etc/xdg/elephant/providers"
}
