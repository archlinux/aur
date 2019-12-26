# Maintainer: Sooo <305784840@qq.com>
pkgname=zentaoclient # '-bzr', '-git', '-hg' or '-svn'
pkgver=3.0.beta4
pkgrel=1
pkgdesc="禅道客户端 zentao client"
arch=(x86_64)
url="https://www.zentao.net/"
license=('unknown')
provides=(${pkgname})
conflicts=(${pkgname})

source=(${pkgname}.desktop ${pkgname}.png)
source_x86_64=(http://dl.cnezsoft.com/${pkgname}/${pkgver}/${pkgname}.linux64.zip)
sha256sums=('029000a6c31a3fd7b19749d198a8eaaaab8f5ca364fed617dfdb7b964311c0b2'
            'fcfe83cb5752e1ce7032325aeb817b6649b504a72ae0a5de24a34d4632ae7330')
sha256sums_x86_64=('b81d60367914482e472ba8e9ea0136083ee98f4992e0cc928ddfd7fdfb1002b9')

depends=(gtk3 libxss nss)

package() {
	install -d "${pkgdir}/opt/${pkgname}"
  	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/share/applications"
	install -d "${pkgdir}/usr/share/icons"

	install -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
  	install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	cp -r "${srcdir}/${pkgname}"/* "${pkgdir}/opt/${pkgname}" -R
	ln -s /opt/${pkgname}/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}
