# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Zacharias Knudsen <zachasme@gmail.com>

pkgname=aws-iam-authenticator-bin
_pkgname="${pkgname%-bin}"
pkgver=0.7.1
pkgrel=1
pkgdesc="A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster"
arch=('x86_64' 'aarch64')
url="https://github.com/kubernetes-sigs/aws-iam-authenticator"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}_${pkgver}_x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64")
source_aarch64=("${_pkgname}_${pkgver}_aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64")
sha256sums_x86_64=('4b33629b01051671d72aa4e98d96709f9653d80f45c33988e9ce12c7be2c508a')
sha256sums_aarch64=('f23a69dd275bcca4b79c53683e78f60ccfa361503d5d1048c4ac735640deeebd')

package() {
	install -D --mode 755 \
		"${srcdir}/${_pkgname}_${pkgver}_${CARCH}" \
		"${pkgdir}/usr/bin/${_pkgname}"
}
