pkgname=timber
pkgver=0.1.2
pkgrel=1
pkgdesc='Decode tree text output to files; also encode dirs to JSON'
arch=('x86_64' 'aarch64')
url='https://github.com/skorotkiewicz/timber'
license=('MIT')
depends=('glibc' 'gcc-libs')
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
# The release workflow computes these checksums before publishing to AUR.
sha256sums_x86_64=('e6c82d2308b95d2131bc0e091ed3614bfff04f6202c8caac26df40417af41b08')
sha256sums_aarch64=('9a099e3e26555e64d6dcdaecdb4ea9cb2d302c87fe8907e28425a0316ea00ca4')

package() {
    install -Dm755 "$srcdir/timber" "$pkgdir/usr/bin/timber"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/timber/README.md"
}
