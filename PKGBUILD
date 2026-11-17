# Maintainer: novica <nnovica@gmail.com>

pkgname=baler-bin
pkgver=0.1.1 # renovate: datasource=github-releases depName=baler-dev/baler
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
sha256sums_x86_64=('da8fa994c20fd4c4d77a37d53b3c2f0e7b0476afda70042b8d7f2abd710bd8eb'
                   'ec04d5f03c96b3c4bd5afec05f4f73536ae26765323747e5969a0760809cdc93')
sha256sums_aarch64=('abeececfd86c93cfb1c85243da115f8f36330f783f7e0d2bb11f38dc125b12be'
                    'ec04d5f03c96b3c4bd5afec05f4f73536ae26765323747e5969a0760809cdc93')
