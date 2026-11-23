# Maintainer: Karlach-xd <zarieltiefling@protonmail.com>

pkgname=ante-bin
pkgver=0.3.8
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
sha256sums_x86_64=('3dc24f3d1502179bc64df28bca8fed655b44e84b92c766fb1bbba159f7de9c20')
sha256sums_aarch64=('f68ce33e03c775a2b5128f9ecf3113df833dd13925c0368dfb935aa4cd8a4b29')

package() {
    install -Dm755 "$srcdir/ante" "$pkgdir/usr/bin/ante"
    install -Dm644 "$srcdir/BINARY-TERMS.md" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

