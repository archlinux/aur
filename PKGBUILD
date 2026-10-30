# Maintainer: Jonas Meinertz Hansen <7hq2skfcm@mozmail.com>
# Contributor: BlackCatDevel0per <bcdev@mail.ru>
# https://github.com/BlackCatDevel0per

pkgname=scalingo-bin
pkgver=1.51.1
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

sha256sums_x86_64=("b3f09933f5f2f5abcb6329b6d94c96f973d8b8f57571f01a5bda92db627e80df")
sha256sums_aarch64=("81c0f21c30c1e6185092d25eb6790f341e22781e2cf97d57a2383a0871238603")

package() {
	cd ${srcdir}/scalingo_${pkgver}_linux_*64

	install -Dm 755 -t "${pkgdir}/usr/bin/" scalingo
	install -Dm 644 -t "${pkgdir}/usr/share/doc/scalingo/" README.md CHANGELOG.md
	install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
