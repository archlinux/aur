# Maintainer: bethropolis <bethropolis at gmail dot com>
pkgname=podbox-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Podman-native container environment manager"
arch=('x86_64')
url="https://github.com/bethropolis/podbox"
license=('MIT')
depends=('podman')
optdepends=(
  'fish: default shell in prebuilt images'
  'openssh: for SSH agent forwarding'
)
options=('!strip' '!debug')
provides=('podbox')
conflicts=('podbox')

source=("https://github.com/bethropolis/podbox/releases/download/v$pkgver/podbox-v$pkgver-linux-x86_64.tar.gz"
        "https://github.com/bethropolis/podbox/releases/download/v$pkgver/podbox-guest-v${pkgver}-linux-x86_64-musl.tar.gz")
sha256sums=('7d27f926c4e2445c0a27c26d16bd12a2b8b6fc5ac6cd83686217638b11a4897a'
            '10e261a25aedae2fd21564d95fef65ad714c5f69adeaebc40f40bf341979ad31')

package() {
  install -Dm755 podbox "${pkgdir}/usr/bin/podbox"
  install -Dm755 podbox-guest "${pkgdir}/usr/bin/podbox-guest"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
