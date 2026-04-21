# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Zacharias Knudsen <zachasme@gmail.com>

pkgname=aws-iam-authenticator-bin
_pkgname="${pkgname%-bin}"
pkgver=0.7.13
pkgrel=1
pkgdesc="A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster"
arch=('x86_64' 'aarch64')
url="https://github.com/kubernetes-sigs/aws-iam-authenticator"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}_${pkgver}_x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64")
source_aarch64=("${_pkgname}_${pkgver}_aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64")
sha256sums_x86_64=('53e0cd1fba499ec70c9d1aee69b0beb281c298e7deda67b4191c3e1ad183b638')
sha256sums_aarch64=('9ad3cb19a3f3fcd32edacaa7199174560c85a95c41e0c451a587cb514b633012')

package() {
	install -D --mode 755 \
		"${srcdir}/${_pkgname}_${pkgver}_${CARCH}" \
		"${pkgdir}/usr/bin/${_pkgname}"
}
