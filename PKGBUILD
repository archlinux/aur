# Maintainer: Tournesol <bonjour@tournesol.me>
_pkgname=hx-lsp
pkgname=hx-lsp-bin
pkgver=0.2.11
pkgrel=2
pkgdesc="One LSP server support snippets and actions for helix editor."
url="https://github.com/erasin/hx-lsp"
license=("MIT")
arch=("x86_64" "aarch64")
provides=("hx-lsp")
conflicts=("hx-lsp")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64-linux.tar.xz")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-aarch64-linux.tar.xz")

sha256sums_x86_64=('6bc1271f6ca945d4235838afbba1629de245ccd87644aa2cfdc593ba145d9c6f')
sha256sums_aarch64=('882a2781d60be71f3a805f623ead2705e9225110d277c3e87ef2ae936ba8d7e0')
package() {
    cd ${_pkgname}-${pkgver}-${CARCH}-linux
    install -Dm755 hx-lsp -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$_pkgname/LICENSE-MIT"
}
