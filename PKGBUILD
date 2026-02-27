# Maintainer: aur@socketbox.com
pkgname=claudectx-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Claude context manager - manage Claude API contexts and profiles"
arch=('x86_64')
url="https://github.com/foxj77/claudectx"
license=('MIT')
source=("https://github.com/foxj77/claudectx/releases/download/v${pkgver}/claudectx_${pkgver}_linux_amd64.tar.gz"
        "https://github.com/foxj77/claudectx/releases/download/v${pkgver}/checksums.txt")
sha256sums=('SKIP'
            'SKIP')

prepare() {
  sha256sum -c <(grep "claudectx_${pkgver}_linux_amd64.tar.gz" checksums.txt) || return 1
}

package() {
  install -Dm755 claudectx "${pkgdir}/usr/bin/claudectx"
}
