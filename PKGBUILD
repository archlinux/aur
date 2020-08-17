# Maintainer: Max Furman <mx.furman@gmail.com>
# Maintainer: Sebastian Tiedtke <sebastiantiedtke@gmail.com>
# Maintainer: Nazar Mishturak <nazarmx@gmail.com>
_binname=step-ca
pkgname=$_binname-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="An online certificate authority and related tools for secure automated certificate management, so you can use TLS everywhere."
arch=('x86_64' 'aarch64')
url="https://smallstep.com/certificates"
license=('Apache')

source_x86_64=("https://github.com/smallstep/certificates/releases/download/v${pkgver}/step-certificates_linux_${pkgver}_amd64.tar.gz")
sha256sums_x86_64=("7ee09c003a520cb26001c6092ca308c0cb70bf798b01312a55f1d2cd6635097c")
source_aarch64=("https://github.com/smallstep/certificates/releases/download/v${pkgver}/step-certificates_linux_${pkgver}_arm64.tar.gz")
sha256sums_aarch64=("8227e905af3b8b3bcdfaf4d53a4c9c7599bd3cfa2267dff3e54c2d9654311e36")

package() {
	install -Dm755 "step-certificates_$pkgver/bin/$_binname" "$pkgdir/usr/bin/$_binname"
	install -Dm644 "step-certificates_$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
