# Maintainer: Willy Micieli <micieli@vivaldi.net>

pkgname=continuous-testing
pkgver=1.1.2
pkgrel=1
pkgdesc="A continuous integration testing project"
provides=("again")
arch=('any')
url="https://github.com/taishingi/continuous-testing"
license=('GPL3')
depends=('packer' 'libnotify' 'curl' 'fuse-overlayfs' 'less' 'rustup' 'fd' 'git')
source=("${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('797d1c07fa0b1d5ab2e48a32c83ead15f80ceeabb1b2f3e52ffe1711037b3166')

package() {
    cd "${pkgname}-${pkgver}"
    cargo build --release
    cargo install --path .
}
