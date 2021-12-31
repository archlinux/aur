# Maintainer sakura1943 <1436700265@qq.com>
pkgname='windterm-bin'
_pkgname='WindTerm'
pkgver='2.2.2'
_pkgver='2.2'
_author='kingToolbox'
pkgrel=2
pkgdesc='A Quicker and better SSH/Telnet/Serial/Shell/Sftp client for DevOps.'
arch=('x86_64')
depends=()
install='install.install'
license=('Apache-2.0')
url='https://github.com/kingToolbox/WindTerm/'
provides=('windterm')
source=("${pkgname}-${pkgver}-${arch}.tar.gz::https://github.com/${_author}/${_pkgname}/releases/download/${_pkgver}/${_pkgname}_${pkgver}_Linux_Portable.tar.gz"
	"windterm.png::https://raw.githubusercontent.com/${_author}/${_pkgname}/master/images/${_pkgname}_icon_1024x1024.png"
	"windterm"
	"windterm.desktop")
sha512sums=('47e8b7e1aaa8d78456ac2e5458da074f0689c5f864ea83c8b33556566a512c6df36aa65bb632a046188a01f5176274e3571043778ccb67dd076d4a29da156dfb'
	"bfdcb9064eca32b06e6c493a48e8b38240cf9133a2d14a8ab45a4c0280bcfbef45f671dc1b86b64d7e6429cfaa6a95a9db7bb8c9c605b3b9aa852998a5abc17e"
	"f825d8ceaf4fe847c8ff94e11e58946147ab3a7eef94b72d90e29c02429047b9f87ad3ca1e23dc2d36fcf1f43667bfcf7ecabd029257a4a5c85bbdc1715169b5"
	"ff9246d8075e65e9efce9e5c2f6e1d5ed9b03d848951b0d8cc5555c475f7af406c4ef51d2ee514399e28218850a866740eb79b411acccfa621d9df7efa0f9c0a")

package (){
	install -d "${pkgdir}"/opt
	install -d "${pkgdir}"/usr/share/icons
	install -d "${pkgdir}"/usr/share/applications
	install -d "${pkgdir}"/usr/bin
	mv "${srcdir}"/* "${pkgdir}"/opt
	mv "${pkgdir}"/opt/${_pkgname}_${pkgver} "${pkgdir}"/opt/${_pkgname}
	chmod -R 0755 "${pkgdir}"/opt/${_pkgname}
	chown -R ${USER}:${USER} "${pkgdir}"/opt/${_pkgname}
	install -Dm755 "${pkgdir}"/opt/windterm.png "${pkgdir}"/usr/share/icons
	install -Dm755 "${pkgdir}"/opt/windterm "${pkgdir}"/usr/bin
	install -Dm755 "${pkgdir}"/opt/windterm.desktop "${pkgdir}"/usr/share/applications
	rm -rf ${pkgdir}/opt/windterm.png ${pkgdir}/opt/windterm ${pkgdir}/opt/windterm.desktop
	chmod 0755 "${pkgdir}"/opt/${_pkgname}/${_pkgname}
}

