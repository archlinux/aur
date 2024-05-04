# Maintainer: leessmin <1442772970@qq.com>

pkgname=kde_gemini
pkgver=0.2.0
pkgrel=1
pkgdesc="自动切换kde桌面主题"
arch=('x86_64')
url="www.github.com/leessmin/kde_gemini"
license=('LGPL3')
depends=('plasma-desktop>=5.20.0')
options=('!strip')
source=("https://github.com/leessmin/kde_gemini/releases/download/$pkgver/$pkgname.tar.xz" $pkgname.desktop)
noextract=('$pkgname.tar.xz')
sha256sums=('12e2fc0da97f203cda38399bb7c075cf014ee4fba8be729d73365e867a2828a6'
			'9a72f9fb0080e68045ea9aa070d316e5ed6b3fc339e7e1a9d6068c2a6c097656')

package() {
	install -dm755 "${pkgdir}"/usr/bin/
	install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
	install -Dm644 "${srcdir}"/usr/local/share/pixmaps/${pkgname}.png "${pkgdir}"/usr/share/pixmaps/${pkgname}.png
	install -Dm755 "${srcdir}"/usr/local/bin/${pkgname} "${pkgdir}"/opt/${pkgname}/${pkgname}

	ln -s /opt/${pkgname}/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}

