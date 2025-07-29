# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-desktopapplications
pkgver=0.1.0
pkgrel=1
pkgdesc='desktopapplications provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('go')
conflicts=('elephant-desktopapplications')
provides=('elephant-desktopapplications')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('480839a4fa06df8c7c34bc91d7804da7c604b64abf5c531f7067f93dcedd7ce4')

build() {
    cd elephant-${pkgver}/internal/providers/desktopapplications
    go build -buildmode=plugin
}

package() {
    cd elephant-${pkgver}/internal/providers/desktopapplications
    install -Dm 755 desktopapplications.so -t "${pkgdir}/etc/xdg/elephant/providers"
}
