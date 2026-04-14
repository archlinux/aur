# Maintainer: Jonas Meinertz Hansen <7hq2skfcm@mozmail.com>
# Contributor: BlackCatDevel0per <bcdev@mail.ru>
# https://github.com/BlackCatDevel0per

pkgname=scalingo-bin
pkgver=1.44.0
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

sha256sums_x86_64=("2b4170db0a2837a5e8eedb0e5999f1458cdb7f49c91e1c97b8e05fad54529191")
sha256sums_aarch64=("bd5c7bb4cce1367e32055b9bb1df71414f6beb74c4739e97c2c58345386f5601")

package() {
	cd ${srcdir}/scalingo_${pkgver}_linux_*64

	install -Dm 755 -t "${pkgdir}/usr/bin/" scalingo
	install -Dm 644 -t "${pkgdir}/usr/share/doc/scalingo/" README.md CHANGELOG.md
	install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
