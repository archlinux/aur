# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# https://github.com/Mayowa-Ojo/chmod-cli/releases/download/v0.2.0/chmod-cli_0.2.0_Linux_x86_64.tar.gz
_pkgauthor=Mayowa-Ojo
_pkgname=chmod-cli
pkgname=${_pkgname}-bin
pkgdesc="A simple cli tool that brings the chmod command in tui format. Generate permissions for files and directories by selecting easy to read config options and copy the result both in numeric and symbolic format."

pkgver=0.2.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('x86_64' 'i386' 'arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}"{,-git})

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_Linux_${_barch[0]}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_Linux_${_barch[1]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_Linux_${_barch[2]}.tar.gz")
sha256sums_x86_64=('fd9e2d67253e5864a949417e29ac85ba0558be2c220456f1cc01dc835088dab5')
sha256sums_i686=('b565a360374533667041fbdf062647936af6a2b385d38008bf7bb8c3f9e7a77d')
sha256sums_aarch64=('0d157c512c99780437401a9365b47cdc9d06b4a842064d5facdc471b5dfb4cd1')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
