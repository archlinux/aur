# Maintainer: leessmin <1442772970@qq.com>

pkgname=kde_gemini
pkgver=0.5.0
pkgrel=4
pkgdesc="自动切换kde桌面主题"
arch=('x86_64')
url="www.github.com/leessmin/kde_gemini"
license=('LGPL3')
depends=('plasma-desktop>=5.20.0')
options=('!strip')
source=("https://github.com/leessmin/kde_gemini/releases/download/$pkgver/$pkgname.tar.xz")
sha256sums=('3c712c6cad444677dadbf89c3c35d1d36cec98a36ea7b22c152ff8a40eb40227')

package() {
	install -dm755 "${pkgdir}"/usr/bin/
	install -Dm644 "${srcdir}"/kde_gemini/usr/local/share/applications/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
	install -Dm644 "${srcdir}"/kde_gemini/usr/local/share/pixmaps/${pkgname}.png "${pkgdir}"/usr/share/pixmaps/${pkgname}.png
	install -Dm755 "${srcdir}"/kde_gemini/usr/local/bin/${pkgname} "${pkgdir}"/opt/${pkgname}/${pkgname}

	ln -s /opt/${pkgname}/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}

