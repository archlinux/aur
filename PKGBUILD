# Maintainer: NikoMitK
pkgname=go-regal-bin
_pkgname="regal"
pkgver=v0.39.0
pkgrel=3
pkgdesc="A linter and language server for Rego"
arch=("x86_64" "aarch64")
url="https://github.com/open-policy-agent/regal"
license=('Apache2.0')
provides=("${pkgname%-bin}")
conflicts=("go-regal-git")
source=("regal-license::https://raw.githubusercontent.com/open-policy-agent/regal/refs/heads/main/LICENSE")
source_x86_64=("regal_Linux::https://github.com/open-policy-agent/regal/releases/download/v0.39.0/regal_Linux_x86_64")
source_aarch64=("regal_Linux::https://github.com/open-policy-agent/regal/releases/download/v0.39.0/regal_Linux_arm64")
sha256sums=('SKIP')
sha256sums_x86_64=('b4fd48ae33a85dc59352b32c34aaea104605d25a43680454f987682751595db9')
sha256sums_aarch64=('866d59c579b9c4b32bb4564a802ad3d0076df9972e2e1d6690a103b146252a8a')

package() {
	install -Dm644 "$srcdir/regal-license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 "$srcdir/regal_Linux" "$pkgdir/usr/bin/regal"
}
