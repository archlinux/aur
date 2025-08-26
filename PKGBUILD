# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-runner
pkgver=1.0.0
pkgrel=6
pkgdesc='runner provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('go')
conflicts=('elephant-runner')
provides=('elephant-runner')
source=("${url}/archive/refs/tags/v${pkgver}-beta-6.tar.gz")
sha256sums=('19a4d683360d173210fcdceaee067dd41cf09f20f1c015df9d512c9acc61520a')

build() {
    cd elephant-${pkgver}-beta-6/internal/providers/runner
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}-beta-6/internal/providers/runner
    install -Dm 755 runner.so -t "${pkgdir}/etc/xdg/elephant/providers"
}
