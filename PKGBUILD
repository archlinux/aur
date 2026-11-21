# Maintainer: Karlach-xd <zarieltiefling@protonmail.com>

pkgname=ante-bin
pkgver=0.3.7
pkgrel=2
pkgdesc="Ante CLI (prebuilt static binary from the official release)"
arch=('x86_64' 'aarch64')
url="https://ante.run"
license=('LicenseRef-ante-binary-preview')
depends=()
provides=('ante')
conflicts=('ante')
options=('!strip')

_baseurl="https://download.ante.run/releases/v${pkgver}"

source=("BINARY-TERMS.md")
source_x86_64=("ante-v${pkgver}-linux-x86_64-musl.tar.gz::${_baseurl}/ante-v${pkgver}-linux-x86_64-musl.tar.gz")
source_aarch64=("ante-v${pkgver}-linux-arm64-musl.tar.gz::${_baseurl}/ante-v${pkgver}-linux-arm64-musl.tar.gz")

sha256sums=('8704fc36dc5f6f29d1764aa26058c70452f9d75687bb815b0efe7cb01ce46dac')
sha256sums_x86_64=('6f7ccd960b2eb4416b1ffb8cdae1232b312debb245340be3d368a5ea8c242538')
sha256sums_aarch64=('5fb65c3e275688230a493e6448fa0411deff33d015a1858554ef901f02746f79')

package() {
    install -Dm755 "$srcdir/ante" "$pkgdir/usr/bin/ante"
    install -Dm644 "$srcdir/BINARY-TERMS.md" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

