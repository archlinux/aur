# Maintainer: Jonas Meinertz Hansen <7hq2skfcm@mozmail.com>
# Contributor: BlackCatDevel0per <bcdev@mail.ru>
# https://github.com/BlackCatDevel0per

pkgname=scalingo-bin
pkgver=1.43.0
pkgrel=1
pkgdesc="Command Line client for Scalingo PaaS"
arch=("x86_64" "aarch64")
license=('BSD-4-Clause' 'MIT')
url="https://github.com/Scalingo/cli"
provides=("scalingo")
conflicts=("scalingo")
options=(!strip !debug)

source_x86_64=("https://github.com/Scalingo/cli/releases/download/${pkgver}/scalingo_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/Scalingo/cli/releases/download/${pkgver}/scalingo_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=("84f1db45037fa429a30e473235f37917994eb2d0bcea8c69bf4601c138514dd3")
sha256sums_aarch64=("1f9059fa9b006fc6e5d526c9f7c3a65ffa17899bfae41187798d8589f8d4c3ff")

package() {
	cd ${srcdir}/scalingo_${pkgver}_linux_*64

	install -Dm 755 -t "${pkgdir}/usr/bin/" scalingo
	install -Dm 644 -t "${pkgdir}/usr/share/doc/scalingo/" README.md CHANGELOG.md
	install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
