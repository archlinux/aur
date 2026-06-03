# Maintainer: NikoMitK
pkgname=go-regal-bin
_pkgname="regal"
pkgver=v0.41.1
pkgrel=5
pkgdesc="A linter and language server for Rego"
arch=("x86_64" "aarch64")
url="https://github.com/open-policy-agent/regal"
license=('Apache2.0')
provides=("${pkgname%-bin}")
conflicts=("go-regal-git")
source=("regal-license::https://raw.githubusercontent.com/open-policy-agent/regal/refs/heads/main/LICENSE")
source_x86_64=("regal_Linux::https://github.com/open-policy-agent/regal/releases/download/v0.41.1/regal_Linux_x86_64")
source_aarch64=("regal_Linux::https://github.com/open-policy-agent/regal/releases/download/v0.41.1/regal_Linux_arm64")
sha256sums=('SKIP')
sha256sums_x86_64=('6769dcd8e88bc5ba5ff4fac500e4a99d55b3eec3d1d0842833d84f6820a2a80f')
sha256sums_aarch64=('225ddfa49fad51d923a4ea2dd53a94557d610b2fb55ae76f6203ca8c0f26b061')

package() {
	install -Dm644 "$srcdir/regal-license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 "$srcdir/regal_Linux" "$pkgdir/usr/bin/regal"
}
