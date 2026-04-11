# Maintainer: Thomas Ramfjord <your-email@example.com>
pkgname=lem-editor
pkgver=2.1.0
pkgrel=1
pkgdesc="A Lisp-based text editor for the modern world"
arch=('x86_64')
url="https://github.com/lem-project/lem"
license=('MIT')
depends=()
makedepends=()
optdepends=()
provides=('lem-editor' 'lem')
conflicts=('lem' 'lem-git')
source=("https://github.com/lem-project/lem/releases/download/v${pkgver}/lem-ubuntu-x86-64-v${pkgver}.tar.gz")
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

package() {
    # Extract and install the lem binary
    install -Dm755 "lem" "${pkgdir}/usr/bin/lem"

    # Create a symlink for the -editor variant
    ln -sf /usr/bin/lem "${pkgdir}/usr/bin/lem-editor" || true
}
