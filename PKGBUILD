# Maintainer plokid <910576949@qq.com>

pkgname=windterm-git
_pkgname=windterm
pkgver=2.2.2
pkgrel=2
pkgdesc='A Quicker and better SSH/Telnet/Serial/Shell/Sftp client for DevOps.'
arch=('x86_64')
depends=('openssh' 'qt5-base' 'gtk3')
license=('Apache')
url='https://github.com/kingToolbox/WindTerm'
provides=(${_pkgname})
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/2.2/WindTerm_${pkgver}_Linux_Portable.tar.gz"
	    "windterm.png"
	    "windterm.desktop")
sha512sums=('47e8b7e1aaa8d78456ac2e5458da074f0689c5f864ea83c8b33556566a512c6df36aa65bb632a046188a01f5176274e3571043778ccb67dd076d4a29da156dfb'
            'bfdcb9064eca32b06e6c493a48e8b38240cf9133a2d14a8ab45a4c0280bcfbef45f671dc1b86b64d7e6429cfaa6a95a9db7bb8c9c605b3b9aa852998a5abc17e'
            'ff9246d8075e65e9efce9e5c2f6e1d5ed9b03d848951b0d8cc5555c475f7af406c4ef51d2ee514399e28218850a866740eb79b411acccfa621d9df7efa0f9c0a')

package (){
	install -d ${pkgdir}/opt/${pkgname}
	install -d ${pkgdir}/usr/share/icons
	install -d ${pkgdir}/usr/share/applications
	install -d ${pkgdir}/usr/bin

    mv ${srcdir}/WindTerm_${pkgver}/* ${pkgdir}/opt/${pkgname}
	chmod 0755 ${pkgdir}/opt/${pkgname}/WindTerm
    install -Dm755 ${srcdir}/windterm.png ${pkgdir}/usr/share/icons/
    install -Dm755 ${srcdir}/windterm.desktop ${pkgdir}/usr/share/applications/
    install -Dm755 ${srcdir}/windterm ${pkgdir}/usr/bin/windterm
}

