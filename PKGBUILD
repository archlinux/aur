# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
_pkgname="letta-code"
pkgname="$_pkgname-bin"
pkgver=0.6.2
pkgrel=1
pkgdesc="The memory-first coding agent"
arch=('x86_64')
url="https://github.com/letta-ai/letta-code"
license=('Apache-2.0')
depends=('nodejs')
conflicts=(
    "$_pkgname"
    # "$_pkgname-bin"
    "$_pkgname-git"
)
source=(
	"letta-linux-x64::$url/releases/download/v${pkgver}/letta.js"
	"https://raw.githubusercontent.com/letta-ai/letta-code/refs/tags/v${pkgver}/bin/letta.js"
)
noextract=()
options=(!strip)
sha256sums=('08ce6477c3a3238e85303700073cdfe69ba189e0a936ac58e0c36ea25734a7fa'
            '587b2968dfe5933c186a4b8f6342e93c8423a0b7d1685b168beefa95f2c16c5e')

prepare() {
    cd "${srcdir}"
    chmod +x ./letta.js
    chmod +x letta-linux-x64
}

package() {
    cd "${srcdir}"
    install -Dm755 ./letta.js "$pkgdir/usr/bin/letta"
    install -Dm755 ./letta-linux-x64 "$pkgdir/usr/bin/letta-linux-x64"
}
