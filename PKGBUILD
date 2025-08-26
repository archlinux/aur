# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-files
pkgver=1.0.0
pkgrel=6
pkgdesc='files provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('fd')
makedepends=('go')
conflicts=('elephant-files')
provides=('elephant-files')
source=("${url}/archive/refs/tags/v${pkgver}-beta-6.tar.gz")
sha256sums=('19a4d683360d173210fcdceaee067dd41cf09f20f1c015df9d512c9acc61520a')

build() {
    cd elephant-${pkgver}-beta-6/internal/providers/files
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}-beta-6/internal/providers/files
    install -Dm 755 files.so -t "${pkgdir}/etc/xdg/elephant/providers"
}
