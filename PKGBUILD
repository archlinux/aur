# Maintainer: Abdul Khaliq <a.khaliq@outlook.my>

pkgname='pingme-bin'
_pkgname="${pkgname%-bin}"
pkgver=0.2.3
pkgrel=4
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
sha256sums_x86_64=(0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5)

source_i686=("${_pkgname}_${pkgver}_linux_i386.tar.gz::${_basedownloadurl}/${_pkgname}_linux_i386.tar.gz")
sha256sums_i686=(b89e92e2fe6686e9e1b18be9a17b2e151b5dc6c0b21e565140e03e5ea422cbbd)

source_aarch64=("${_pkgname}_${pkgver}_linux_arm64.tar.gz::${_basedownloadurl}/${_pkgname}_linux_arm64.tar.gz")
sha256sums_aarch64=(e288b34282ad5d50bcb722e41880954b49444f28f2e8de08e2e7a06ef3d41069)

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

}
