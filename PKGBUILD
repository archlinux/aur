# Maintainer: Sooo <305784840@qq.com>
pkgname=zentaoclient # '-bzr', '-git', '-hg' or '-svn'
pkgver=2.5.7
pkgrel=1
pkgdesc="禅道客户端 zentao client"
arch=(x86_64)
url="https://www.zentao.net/"
license=('custom: commercial')
provides=(${pkgname})
conflicts=(${pkgname})

source=(${pkgname}.desktop ${pkgname}.png)
source_x86_64=(http://dl.cnezsoft.com/${pkgname}/${pkgver}/${pkgname}.linux64.zip)
sha256sums=(029000a6c31a3fd7b19749d198a8eaaaab8f5ca364fed617dfdb7b964311c0b2
			fcfe83cb5752e1ce7032325aeb817b6649b504a72ae0a5de24a34d4632ae7330)
sha256sums_x86_64=(053f6016ded1923cf7bd59aa782a5c4e40e2d59e5999ea335fce11249a0b4ccd)

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
