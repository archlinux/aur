# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-websearch
pkgver=1.0.0
pkgrel=4
pkgdesc='websearch provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('go')
conflicts=('elephant-websearch')
provides=('elephant-websearch')
source=("${url}/archive/refs/tags/v${pkgver}-beta-5.tar.gz")
sha256sums=('1c324928dcfe81299a59420276113df7738965659322b6762cfbd619d1b0eb5c')

build() {
    cd elephant-${pkgver}-beta-5/internal/providers/websearch
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}-beta-5/internal/providers/websearch
    install -Dm 755 websearch.so -t "${pkgdir}/etc/xdg/elephant/providers"
}
