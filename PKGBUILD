# Maintainer: aur@socketbox.com
pkgname=claudectx-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Claude context manager - manage Claude API contexts and profiles"
arch=('x86_64')
url="https://github.com/foxj77/claudectx"
license=('MIT')
source=("https://github.com/foxj77/claudectx/releases/download/v${pkgver}/claudectx_${pkgver}_linux_amd64.tar.gz"
        "https://github.com/foxj77/claudectx/releases/download/v${pkgver}/checksums.txt")
sha256sums=('308e67be3ffa595e5986f252a02ef46c4da6fefd5a9c83c2e261e2411330e34b'
            'f79f7cd2240aa4f4f0ee76206f24eff6849f00aa108ccb0991f159ab61e1e136')

prepare() {
  sha256sum -c <(grep "claudectx_${pkgver}_linux_amd64.tar.gz" checksums.txt) || return 1
}

package() {
  install -Dm755 claudectx "${pkgdir}/usr/bin/claudectx"
}
