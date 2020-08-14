# Maintainer: Max Furman <mx.furman@gmail.com>
# Maintainer: Sebastian Tiedtke <sebastiantiedtke@gmail.com>
# Maintainer: Nazar Mishturak <nazarmx@gmail.com>
_binname=step-ca
pkgname=$_binname-bin
pkgver=0.14.6
pkgrel=2
pkgdesc="An online certificate authority and related tools for secure automated certificate management, so you can use TLS everywhere."
arch=('x86_64' 'aarch64')
url="https://smallstep.com/certificates"
license=('Apache')

source_x86_64=("https://github.com/smallstep/certificates/releases/download/v${pkgver}/step-certificates_linux_${pkgver}_amd64.tar.gz")
sha256sums_x86_64=('3b026b5a1603eb6fae3b6f24dc78ef2e73e416f11fb5bcf0edaad5663ea1107c')
source_aarch64=("https://github.com/smallstep/certificates/releases/download/v${pkgver}/step-certificates_linux_${pkgver}_arm64.tar.gz")
sha256sums_aarch64=("851307a59a73843a907150ae8ec89b664af481c95816088ff4c6e3ad0e30d9ec")

package() {
	install -Dm755 "step-certificates_$pkgver/bin/$_binname" "$pkgdir/usr/bin/$_binname"
	install -Dm644 "step-certificates_$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
