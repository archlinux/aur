# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=zsuroy
_gitname=ctty
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Lightweight all-in-one TUI connection manager for SSH, Serial, SFTP, Telnet, FTP and WebDAV"

pkgver=1.4.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('Linux_x86_64' 'Linux_i386' 'Linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}.tar.gz")
source_i686=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}.tar.gz")
source_aarch64=("${_appname}-${arch[2]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[2]}.tar.gz")
sha256sums_x86_64=('e6f7b46d3364d38794263db9a0a553781e12e3494e85bd407fa9ddc3f523466c')
sha256sums_i686=('9f7bb726a486a77a05d21a34ff0effbd34d2cbc4dbf9813c6b80995404602aa2')
sha256sums_aarch64=('d1d311296144a1c23870ecd77266d3eb1610c99ce007b986c470ac3eae2a033a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
