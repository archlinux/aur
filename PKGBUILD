# Maintainer: tonikelope <tonikelope@gmail.com>
pkgname=coronapoker
pkgver=6.22
pkgrel=1
pkgdesc="Yet another cross-platform Texas hold 'em game written in Java during COVID-19 pandemic"
arch=('x86_64')
url="https://tonikelope.github.io/coronapoker/"
license=('GPL3')

source=("https://github.com/tonikelope/coronapoker/releases/download/v${pkgver}/CoronaPokerLINUX_${pkgver}_portable.zip")

package() {
	mkdir -p "${pkgdir}/opt/${pkgname}/"
	chmod 0755 "${pkgdir}/opt/${pkgname}/"
	cp -RT "${srcdir}/CoronaPokerLINUX/" "${pkgdir}/opt/${pkgname}"
	chmod +x "${pkgdir}/opt/${pkgname}/CoronaPoker.run"
	chmod 0777 "${pkgdir}/opt/${pkgname}/jar/"
	install -Dm644 "${srcdir}/CoronaPokerLINUX/${pkgname}.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
	install -Dm644 "${srcdir}/CoronaPokerLINUX/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
	mkdir -p "${pkgdir}/usr/local/bin/"
	ln -s "/opt/${pkgname}/CoronaPoker.run" "$pkgdir/usr/local/bin/coronapoker"
}

md5sums=('c9ebf19c34d3353d7150aee84f908eb8')