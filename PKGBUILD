# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-runner
pkgver=1.0.0
pkgrel=18
pkgdesc='runner provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('go')
conflicts=('elephant-runner')
provides=('elephant-runner')
source=("${url}/archive/refs/tags/v${pkgver}-beta-18.tar.gz")
sha256sums=('6b076a88f902c1d669556fd64cf95dde5d1d1156ddec02690e00a6252307e897')

build() {
    cd elephant-${pkgver}-beta-18/internal/providers/runner
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}-beta-18/internal/providers/runner
    install -Dm 755 runner.so -t "${pkgdir}/etc/xdg/elephant/providers"
}
