# Maintainer: Jonas Meinertz Hansen <7hq2skfcm@mozmail.com>
# Contributor: BlackCatDevel0per <bcdev@mail.ru>
# https://github.com/BlackCatDevel0per

pkgname=scalingo-bin
pkgver=1.49.0
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

sha256sums_x86_64=("aa5dae4fc05e991cae162b6d2fb71e597c785779c718d4cd0a7d9aca33485055")
sha256sums_aarch64=("6804e236966a093abedcd5981e0691d7da40c2452bce1a91a586426bfefc1309")

package() {
	cd ${srcdir}/scalingo_${pkgver}_linux_*64

	install -Dm 755 -t "${pkgdir}/usr/bin/" scalingo
	install -Dm 644 -t "${pkgdir}/usr/share/doc/scalingo/" README.md CHANGELOG.md
	install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
