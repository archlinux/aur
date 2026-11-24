# Maintainer: Karlach-xd <zarieltiefling@protonmail.com>

pkgname=ante-bin
pkgver=0.3.9
pkgrel=1
pkgdesc="Ante — A self-contained coding agent."
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
sha256sums_x86_64=('359a54fe35a4d4b502b882573d5f4545bf34c02504e8e329d6441e7bd8117c5f')
sha256sums_aarch64=('9cef8c3248c6e3935b997f31c085226d30e12459262f3b5666c1b6b3942e1212')

package() {
    install -Dm755 "$srcdir/ante" "$pkgdir/usr/bin/ante"
    install -Dm644 "$srcdir/BINARY-TERMS.md" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

