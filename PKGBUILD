# Maintainer: Abdul Khaliq <a.khaliq@outlook.my>

pkgname='pingme-bin'
_pkgname="${pkgname%-bin}"
pkgver=0.2.5
pkgrel=1
pkgdesc="PingMe is a CLI tool which provides the ability to send messages or alerts to multiple messaging platforms & email. (official binary)"
url='https://pingme.lmno.pk'
arch=("i686" "x86_64" "aarch64")
license=("MIT")
provides=("${_pkgname}")
conflicts=("${_pkgname}")

depends=()
makedepends=()
optdepends=('nfpm: deb and rpm packager')

_basedownloadurl="https://github.com/kha7iq/${_pkgname}/releases/download/v${pkgver}"

source_x86_64=("${_pkgname}_${pkgver}_linux_x86_64.tar.gz::${_basedownloadurl}/${_pkgname}_linux_x86_64.tar.gz")
sha256sums_x86_64=(93133b9c978d5a579526261255c2a7a9ca6dfc5ab42ef65e1de4fab15d8ac808)

source_i686=("${_pkgname}_${pkgver}_linux_i386.tar.gz::${_basedownloadurl}/${_pkgname}_linux_i386.tar.gz")
sha256sums_i686=(5a14e80693800284f11daf7d5ba71a7cbe78e18948579584f36069d7a2f31d4a)

source_aarch64=("${_pkgname}_${pkgver}_linux_arm64.tar.gz::${_basedownloadurl}/${_pkgname}_linux_arm64.tar.gz")
sha256sums_aarch64=(496bb93402611d5710bc66b26f64f13fc0f888d0b3cc1f4d7960c7c631860dd3)

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

}
