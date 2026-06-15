# Maintainer: Jonas Meinertz Hansen <7hq2skfcm@mozmail.com>
# Contributor: BlackCatDevel0per <bcdev@mail.ru>
# https://github.com/BlackCatDevel0per

pkgname=scalingo-bin
pkgver=1.45.0
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

sha256sums_x86_64=("493c035e67d8abcc47e0446918d8ed8d219b7ff66660b7c64a2054776fb80224")
sha256sums_aarch64=("5ddac31fd03431b9779a46a6cf1d45d474ce63c5f6a50d67eb3136f39fa9f3a6")

package() {
	cd ${srcdir}/scalingo_${pkgver}_linux_*64

	install -Dm 755 -t "${pkgdir}/usr/bin/" scalingo
	install -Dm 644 -t "${pkgdir}/usr/share/doc/scalingo/" README.md CHANGELOG.md
	install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
