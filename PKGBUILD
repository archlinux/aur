# Maintainer: noctulus <fangyuhao0612@gmail.com>

pkgname=flutter-dmzj-bin
pkgver=2.0.6_beta
pkgrel=1
pkgdesc="使用Flutter编写的动漫之家跨平台第三方客户端 "
arch=('x86_64')
url="https://github.com/xiaoyaocz/flutter_dmzj"
license=('GPL3')
depends=('gtk3')
source=(
	"https://github.com/xiaoyaocz/flutter_dmzj/releases/download/v2.0.6-beta/flutter_dmzj-2.0.6+20006-linux.zip"
	flutter_dmzj.desktop)
sha256sums=('abaa4bf6d114b584a9de3cb19ec54922db8388d0b352ab26ba01f3e062d0c237'
            '962d471c2aa068e6daa4496a9104c58d41119d4106c09232e5b98d3ed4ecf11a')

package() {
	install -dm 755 "${pkgdir}/opt/${pkgname}"
	cp -ra "${srcdir}/"{data,lib,flutter_dmzj} "${pkgdir}/opt/${pkgname}"
	chmod a+rx "${pkgdir}/opt/${pkgname}/flutter_dmzj"
	
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/flutter_dmzj" "${pkgdir}/usr/bin/flutter_dmzj"
	
	install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
	ln -s "/opt/${pkgname}/data/flutter_assets/assets/images/logo.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/flutter_dmzj.png"
	
	install -dm755 "${pkgdir}/usr/share/applications"
	install -Dm644 flutter_dmzj.desktop "${pkgdir}/usr/share/applications/"
}
