# Maintainer: leessmin <1442772970@qq.com>

pkgname=kde_gemini
pkgver=0.3.0
pkgrel=1
pkgdesc="自动切换kde桌面主题"
arch=('x86_64')
url="www.github.com/leessmin/kde_gemini"
license=('LGPL3')
depends=('plasma-desktop>=5.20.0')
options=('!strip')
source=("https://github.com/leessmin/kde_gemini/releases/download/$pkgver/$pkgname.tar.xz")
noextract=('$pkgname.tar.xz')
sha256sums=('eb899989c9175e6940bf2df01032198e7cc497322a4409f7e39f962fbe454cbe')

package() {
	install -dm755 "${pkgdir}"/usr/bin/
	install -Dm644 "${srcdir}"/usr/local/share/applications/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
	install -Dm644 "${srcdir}"/usr/local/share/pixmaps/${pkgname}.png "${pkgdir}"/usr/share/pixmaps/${pkgname}.png
	install -Dm755 "${srcdir}"/usr/local/bin/${pkgname} "${pkgdir}"/opt/${pkgname}/${pkgname}

	ln -s /opt/${pkgname}/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}

