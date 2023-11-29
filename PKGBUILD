# Maintainer: Abdul Khaliq <a.khaliq@outlook.my>

pkgname='pingme-bin'
_pkgname="${pkgname%-bin}"
pkgver=
pkgrel=1
pkgdesc="PingMe is a CLI tool which provides the ability to send messages or alerts to multiple messaging platforms & email. (official binary)"
url='https://pingme.lmno.pk'
arch=("i686" "amd64" "aarch64")
license=("MIT")
provides=("${_pkgname}")
conflicts=("${_pkgname}")

depends=()
makedepends=()
optdepends=('nfpm: deb and rpm packager')

_basedownloadurl="https://github.com/kha7iq/${_pkgname}/releases/download/v${pkgver}"

source_amd64=("${_pkgname}_${pkgver}_linux_amd64.tar.gz::${_basedownloadurl}/${_pkgname}_linux_amd64.tar.gz")
sha256sums_amd64=(${SHA256SUM_AMD64})

source_i686=("${_pkgname}_${pkgver}_linux_i386.tar.gz::${_basedownloadurl}/${_pkgname}_linux_i386.tar.gz")
sha256sums_i686=(0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5)

source_aarch64=("${_pkgname}_${pkgver}_linux_arm64.tar.gz::${_basedownloadurl}/${_pkgname}_linux_arm64.tar.gz")
sha256sums_aarch64=(0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5)

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

}
