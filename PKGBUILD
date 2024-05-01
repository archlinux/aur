# Maintainer: noctulus <fangyuhao0612@gmail.com>

pkgname=flutter-dmzj-bin
pkgver=2.0.9
pkgrel=1
pkgdesc="使用Flutter编写的动漫之家跨平台第三方客户端 "
arch=('x86_64')
url="https://github.com/xiaoyaocz/flutter_dmzj"
license=('GPL3')
depends=('gtk3')
source=(
	"https://github.com/xiaoyaocz/flutter_dmzj/releases/download/v2.0.9/flutter_dmzj-2.0.9+20009-linux.zip"
	flutter_dmzj.desktop)
sha256sums=('0cf71ef8839913971c1388359791616f99cf0507593d63f0331bd11f36ca94db'
            '962d471c2aa068e6daa4496a9104c58d41119d4106c09232e5b98d3ed4ecf11a')

package() {
	install -dm 755 "${pkgdir}/opt/${pkgname%-bin}"
	cp -ra "${srcdir}/"{data,lib,flutter_dmzj} "${pkgdir}/opt/${pkgname%-bin}"
	chmod a+rx "${pkgdir}/opt/${pkgname%-bin}/flutter_dmzj"
	
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname%-bin}/flutter_dmzj" "${pkgdir}/usr/bin/flutter_dmzj"
	
	install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
	ln -s "/opt/${pkgname%-bin}/data/flutter_assets/assets/images/logo.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/flutter_dmzj.png"
	
	install -dm755 "${pkgdir}/usr/share/applications"
	install -Dm644 flutter_dmzj.desktop "${pkgdir}/usr/share/applications/"
}
