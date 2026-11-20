# Maintainer: novica <nnovica@gmail.com>

pkgname=baler-bin
pkgver=0.2.0 # renovate: datasource=github-releases depName=baler-dev/baler
pkgrel=1
pkgdesc="A Cargo-style package manager for {box} modules"
arch=('x86_64' 'aarch64')
url="https://github.com/baler-dev/baler"
license=('MIT')
depends=('glibc' 'libgcc')
conflicts=('baler')
options=('!debug')
provides_x86_64=("baler=${pkgver}")
provides_aarch64=("baler=${pkgver}")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/baler-dev/baler/releases/download/v${pkgver}/baler-x86_64-unknown-linux-gnu.tar.gz"
               "LICENSE::https://raw.githubusercontent.com/baler-dev/baler/refs/tags/v${pkgver}/LICENSE.md")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/baler-dev/baler/releases/download/v${pkgver}/baler-aarch64-unknown-linux-gnu.tar.gz"
                "LICENSE::https://raw.githubusercontent.com/baler-dev/baler/refs/tags/v${pkgver}/LICENSE.md")

package() {
    cd "$srcdir"/baler-*-unknown-linux-gnu

    install -Dm755 baler "$pkgdir/usr/bin/baler"
    install -Dm644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
sha256sums_x86_64=('d780d8b1b8d2688ca6bce380b7d72c38a880012920cbf3791f147c6be35d955b'
                   'ec04d5f03c96b3c4bd5afec05f4f73536ae26765323747e5969a0760809cdc93')
sha256sums_aarch64=('76b59678be4c2e8d182eead82d3c305f4305931925affc45036bb19e207232cd'
                    'ec04d5f03c96b3c4bd5afec05f4f73536ae26765323747e5969a0760809cdc93')
