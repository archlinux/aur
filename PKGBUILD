# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Zacharias Knudsen <zachasme@gmail.com>

pkgname=aws-iam-authenticator-bin
_pkgname="${pkgname%-bin}"
pkgver=0.7.5
pkgrel=1
pkgdesc="A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster"
arch=('x86_64' 'aarch64')
url="https://github.com/kubernetes-sigs/aws-iam-authenticator"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}_${pkgver}_x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64")
source_aarch64=("${_pkgname}_${pkgver}_aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64")
sha256sums_x86_64=('aef183b5b92f2cb135107234c7440f43638caa337190190cdd2ad9fd6bc4928e')
sha256sums_aarch64=('80ab2b0d5a139e55408c785703e8fef8f4974a73409046b3e13df19b2a780a51')

package() {
	install -D --mode 755 \
		"${srcdir}/${_pkgname}_${pkgver}_${CARCH}" \
		"${pkgdir}/usr/bin/${_pkgname}"
}
