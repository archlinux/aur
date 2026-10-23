# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=simonwhitaker
_gitname=shellsnake
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Play Snake on the command line!"

pkgver=1.0.6
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('Linux_x86_64' 'Linux_i386' 'Linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('LicenseRef-UNLICENSE')

depends=('bash')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}.tar.gz")
source_i686=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}.tar.gz")
source_aarch64=("${_appname}-${arch[2]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[2]}.tar.gz")
sha256sums_x86_64=('ac760bf9fb57f5cbdedf5fc775eb60c1cda102d957c0702758dfd32974045b65')
sha256sums_i686=('5269b1cd53afbf6bb2c4f37adc863643a9fbca5458037f33e59f3a1d1589429b')
sha256sums_aarch64=('5bfc9d3e84714ace5f6384027a4a3e686aef2f586f5fd0f008dffe43ba9b5061')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

