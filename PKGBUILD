# Maintainer: Max Furman <mx.furman@gmail.com>
# Maintainer: Sebastian Tiedtke <sebastiantiedtke@gmail.com>
# Maintainer: Nazar Mishturak <nazarmx@gmail.com>
_binname=step-ca
pkgname=$_binname-bin
pkgver=0.15.5
pkgrel=1
pkgdesc="An online certificate authority and related tools for secure automated certificate management, so you can use TLS everywhere."
arch=('x86_64' 'aarch64')
url="https://smallstep.com/certificates"
license=('Apache')

source_x86_64=("https://github.com/smallstep/certificates/releases/download/v${pkgver}/step-certificates_linux_${pkgver}_amd64.tar.gz")
sha256sums_x86_64=("4fecd42ce5f7b93db096a599b2c3579d0d4cfa0722f554cfa5a420bee1abeefb")
source_aarch64=("https://github.com/smallstep/certificates/releases/download/v${pkgver}/step-certificates_linux_${pkgver}_arm64.tar.gz")
sha256sums_aarch64=("0b6530194c2b34c1c6de1f82053d24c8f714f88a7be6cb47a6468abe084206d7")

package() {
	install -Dm755 "step-certificates_$pkgver/bin/$_binname" "$pkgdir/usr/bin/$_binname"
	install -Dm644 "step-certificates_$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
