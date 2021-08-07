# Maintainer: Abdul Khaliq <a.khaliq@outlook.my>

pkgname='pingme-bin'
_pkgname="${pkgname%-bin}"
pkgver=0.2.4
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
sha256sums_x86_64=(f50558f8b442b319b306dc1ee4619293ac4d0ace5cadba8fd6f129ea100ea6ca)

source_i686=("${_pkgname}_${pkgver}_linux_i386.tar.gz::${_basedownloadurl}/${_pkgname}_linux_i386.tar.gz")
sha256sums_i686=(51be9ae16ece28419400d15ce3252a16e29deb65d4229c48b2213369a7cbecfb)

source_aarch64=("${_pkgname}_${pkgver}_linux_arm64.tar.gz::${_basedownloadurl}/${_pkgname}_linux_arm64.tar.gz")
sha256sums_aarch64=(92ac1ef472fe7b140309dc426e49d34b4a69e72c5c1c66764c23d78943c34798)

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

}
