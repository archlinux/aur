# Maintainer: NikoMitK
pkgname=go-regal-bin
_pkgname="regal"
pkgver=v0.40.0
pkgrel=4
pkgdesc="A linter and language server for Rego"
arch=("x86_64" "aarch64")
url="https://github.com/open-policy-agent/regal"
license=('Apache2.0')
provides=("${pkgname%-bin}")
conflicts=("go-regal-git")
source=("regal-license::https://raw.githubusercontent.com/open-policy-agent/regal/refs/heads/main/LICENSE")
source_x86_64=("regal_Linux::https://github.com/open-policy-agent/regal/releases/download/v0.40.0/regal_Linux_x86_64")
source_aarch64=("regal_Linux::https://github.com/open-policy-agent/regal/releases/download/v0.40.0/regal_Linux_arm64")
sha256sums=('SKIP')
sha256sums_x86_64=('0301464f1b2ea4e2458cec63cdde4557db09bcbe47505a7bbbfe6bf47aeab234')
sha256sums_aarch64=('af9c2e76a6422628eb82cc228e259cf45e48934eb14c24558d8a7302b085fd99')

package() {
	install -Dm644 "$srcdir/regal-license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 "$srcdir/regal_Linux" "$pkgdir/usr/bin/regal"
}
