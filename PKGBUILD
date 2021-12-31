# Maintainer sakura1943 <1436700265@qq.com>
pkgname='windterm-bin'
_pkgname='WindTerm'
pkgver='2.2.2'
_pkgver='2.2'
_author='kingToolbox'
pkgrel=3
pkgdesc='A Quicker and better SSH/Telnet/Serial/Shell/Sftp client for DevOps.'
arch=('x86_64')
depends=()
license=('Apache-2.0')
install='install.install'
url='https://github.com/kingToolbox/WindTerm/'
provides=('windterm')
source=("${pkgname}-${pkgver}-${arch}.tar.gz::https://github.com/${_author}/${_pkgname}/releases/download/${_pkgver}/${_pkgname}_${pkgver}_Linux_Portable.tar.gz"
	"windterm.png::https://raw.githubusercontent.com/${_author}/${_pkgname}/master/images/${_pkgname}_icon_1024x1024.png"
	"windterm"
	"windterm.desktop")
sha512sums=('47e8b7e1aaa8d78456ac2e5458da074f0689c5f864ea83c8b33556566a512c6df36aa65bb632a046188a01f5176274e3571043778ccb67dd076d4a29da156dfb'
	"bfdcb9064eca32b06e6c493a48e8b38240cf9133a2d14a8ab45a4c0280bcfbef45f671dc1b86b64d7e6429cfaa6a95a9db7bb8c9c605b3b9aa852998a5abc17e"
	"c89b70212dbe6bfbfcdbf9d69deb354fbfcd1896815ebd69aee7b9f4ea9c0bb098b127aa2fa25436f17902ccb25ecf7eb720a98e2d8ad8d67ab428e747acbc6b"
	"ff9246d8075e65e9efce9e5c2f6e1d5ed9b03d848951b0d8cc5555c475f7af406c4ef51d2ee514399e28218850a866740eb79b411acccfa621d9df7efa0f9c0a")

_USER_PATH="${HOME}/.local/share"
package (){
	install -d ${_USER_PATH}
	install -d "${pkgdir}"/usr/share/icons
	install -d "${pkgdir}"/usr/share/applications
	install -d "${pkgdir}"/usr/bin
	mv ${srcdir}/${_pkgname}_${pkgver} ${_USER_PATH}
	mv ${_USER_PATH}/${_pkgname}_${pkgver} ${_USER_PATH}/${_pkgname}
	install -Dm755 ${srcdir}/windterm.png "${pkgdir}"/usr/share/icons
	install -Dm755 ${srcdir}/windterm "${pkgdir}"/usr/bin
	install -Dm755 ${srcdir}/windterm.desktop "${pkgdir}"/usr/share/applications
}

