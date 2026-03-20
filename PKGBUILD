# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Zacharias Knudsen <zachasme@gmail.com>

pkgname=aws-iam-authenticator-bin
_pkgname="${pkgname%-bin}"
pkgver=0.7.11
pkgrel=1
pkgdesc="A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster"
arch=('x86_64' 'aarch64')
url="https://github.com/kubernetes-sigs/aws-iam-authenticator"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}_${pkgver}_x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64")
source_aarch64=("${_pkgname}_${pkgver}_aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64")
sha256sums_x86_64=('8523d92af5680dbc7af81a75be63ffdb36040e061e8e318d322e01dceff85a1f')
sha256sums_aarch64=('359d9e563a029d60d306c61ee17a6e4325ba0c9291c4d1fdd848c514abba49de')

package() {
	install -D --mode 755 \
		"${srcdir}/${_pkgname}_${pkgver}_${CARCH}" \
		"${pkgdir}/usr/bin/${_pkgname}"
}
