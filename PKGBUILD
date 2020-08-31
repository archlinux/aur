# Maintainer: Max Furman <mx.furman@gmail.com>
# Maintainer: Sebastian Tiedtke <sebastiantiedtke@gmail.com>
# Maintainer: Nazar Mishturak <nazarmx@gmail.com>
_binname=step-ca
pkgname=$_binname-bin
pkgver=0.15.2
pkgrel=1
pkgdesc="An online certificate authority and related tools for secure automated certificate management, so you can use TLS everywhere."
arch=('x86_64' 'aarch64')
url="https://smallstep.com/certificates"
license=('Apache')

source_x86_64=("https://github.com/smallstep/certificates/releases/download/v${pkgver}/step-certificates_linux_${pkgver}_amd64.tar.gz")
sha256sums_x86_64=("051374a04dcb2f1722b00ff88617f231a819d9aa1ede26cedd93ff91eeb339de")
source_aarch64=("https://github.com/smallstep/certificates/releases/download/v${pkgver}/step-certificates_linux_${pkgver}_arm64.tar.gz")
sha256sums_aarch64=("1893aea4dc1b10a448ebff755bc951d3a664e2253577309224ebe775e085bcaa")

package() {
	install -Dm755 "step-certificates_$pkgver/bin/$_binname" "$pkgdir/usr/bin/$_binname"
	install -Dm644 "step-certificates_$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
