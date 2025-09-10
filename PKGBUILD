# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Zacharias Knudsen <zachasme@gmail.com>

pkgname=aws-iam-authenticator-bin
_pkgname="${pkgname%-bin}"
pkgver=0.7.7
pkgrel=1
pkgdesc="A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster"
arch=('x86_64' 'aarch64')
url="https://github.com/kubernetes-sigs/aws-iam-authenticator"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}_${pkgver}_x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64")
source_aarch64=("${_pkgname}_${pkgver}_aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64")
sha256sums_x86_64=('0eb99e8f1ce1db908a56002efff6fe1f20a16b9e775b2f7ada2c3b9c77292bb6')
sha256sums_aarch64=('b0efa112e0ccce09188c262b30d9694bbc3a160f8aa52f2d28029b65113ef8c6')

package() {
	install -D --mode 755 \
		"${srcdir}/${_pkgname}_${pkgver}_${CARCH}" \
		"${pkgdir}/usr/bin/${_pkgname}"
}
