# Maintainer: NikoMitK
pkgname=go-regal-bin
_pkgname="regal"
pkgver=v0.37.0
pkgrel=1
pkgdesc="A linter and language server for Rego"
arch=("x86_64" "aarch64")
url="https://github.com/StyraInc/regal"
license=('Apache2.0')
provides=("${pkgname%-bin}")
conflicts=("go-regal-git")
source=("regal-license::https://raw.githubusercontent.com/open-policy-agent/regal/refs/heads/main/LICENSE")
source_x86_64=("regal_Linux::https://github.com/open-policy-agent/regal/releases/download/v0.37.0/regal_Linux_x86_64")
source_aarch64=("regal_Linux::https://github.com/open-policy-agent/regal/releases/download/v0.37.0/regal_Linux_arm64")
sha256sums=('SKIP')
sha256sums_x86_64=('57b5946c1efad556cb88a4d0deaacc4dbc31a7d7610fbf701df268eddab04b6d')
sha256sums_aarch64=('f5bd13057d0884a95a4b94556669f0d19d00487812b66bb988eadecde5e05257')

package() {
	install -Dm644 "$srcdir/regal-license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 "$srcdir/regal_Linux" "$pkgdir/usr/bin/regal"
}
