# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
_pkgname="letta-code"
pkgname="$_pkgname-bin"
pkgver=0.7.1
pkgrel=1
pkgdesc="The memory-first coding agent"
arch=('x86_64' 'aarch64')
url="https://github.com/letta-ai/letta-code"
license=('Apache-2.0')
depends=('nodejs')
conflicts=(
    "$_pkgname"
    # "$_pkgname-bin"
    "$_pkgname-git"
)
source=(
	"letta.js::$url/releases/download/v${pkgver}/letta.js"
)
noextract=()
options=(!strip)
sha256sums=('08ce6477c3a3238e85303700073cdfe69ba189e0a936ac58e0c36ea25734a7fa')

prepare() {
    cd "${srcdir}"
    chmod +x ./letta.js
}

package() {
    cd "${srcdir}"
    install -Dm755 ./letta.js "$pkgdir/usr/bin/letta"
}
