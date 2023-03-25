pkgname=flutter-dmzj-bin
pkgver=2.0.4_beta
pkgrel=1
pkgdesc="使用Flutter编写的动漫之家跨平台第三方客户端 "
arch=('x86_64')
url="https://github.com/xiaoyaocz/flutter_dmzj"
license=('GPL3')
depends=('gtk3')
source=(
	"https://github.com/xiaoyaocz/flutter_dmzj/releases/download/v2.0.4-beta/flutter_dmzj-2.0.4+20004-linux.zip"
	flutter_dmzj.desktop)
sha256sums=('2a31da9c498c924d93842864d40b009f2cc975c3f2f6f54e7b1dcb075badd4f3'
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
