# Maintainer: Guillaume Ausset <guillaume+arch@ausset.me>

pkgname=colgrep-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Semantic code search powered by ColBERT (prebuilt binary)"
arch=('x86_64')
url="https://github.com/lightonai/next-plaid"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc' 'openssl')
provides=('colgrep')
conflicts=('colgrep')
source=("https://github.com/lightonai/next-plaid/releases/download/v${pkgver}/colgrep-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=('0bb54942c28e5a1513d6027816e3f8b8ab7f69cc9d96a36bf128afaff3b84f7d')

package() {
	cd "${srcdir}/colgrep-x86_64-unknown-linux-gnu"
	install -Dm755 "colgrep" "${pkgdir}/usr/bin/colgrep"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}