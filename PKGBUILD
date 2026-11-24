# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=zsuroy
_gitname=ctty
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Lightweight all-in-one TUI connection manager for SSH, Serial, SFTP, Telnet, FTP and WebDAV"

pkgver=1.4.0
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
sha256sums_x86_64=('fede34e27cd8d86aaf8c7087b164fd227dbc28aecc8c3d35a5bce99cc29d25af')
sha256sums_i686=('34e6c60e5f84fba124121456552003f8316cc9b832f6e3d695238a9713b07fc7')
sha256sums_aarch64=('32b27c7e77181e6a3beeb8d65804232af0266c150e2f2108c40ed4b21d834c89')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
