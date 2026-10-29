pkgname=crier
pkgver=0.3.0
pkgrel=1
pkgdesc='Simple push notification tool for TCP and MQTT'
arch=('x86_64' 'aarch64')
url='https://github.com/skorotkiewicz/crier'
license=('MIT')
depends=('glibc' 'gcc-libs')
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
# The release workflow computes these checksums before publishing to AUR.
sha256sums_x86_64=('965c1ab8870d390e3399a2657fb82c4d8a8719e066cccefbb69f9a9a847dcaa1')
sha256sums_aarch64=('1073b61376c540132059cfe132d0304b807a219c2460c05aeb0b8766832c3b41')

package() {
    install -Dm755 "$srcdir/crier" "$pkgdir/usr/bin/crier"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/crier/README.md"
    install -Dm644 "$srcdir/crier.example.yml" "$pkgdir/usr/share/doc/crier/crier.example.yml"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/crier/LICENSE"
}
