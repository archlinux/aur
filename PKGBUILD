# Maintainer: Xaver Hellauer <software@hellauer.bayern>

pkgname=mojibar
pkgver=2.4.0
pkgrel=1
pkgdesc="🍊 Emoji searcher but as a menubar app."
arch=('x86_64')
url='https://github.com/muan/mojibar'
license=('MIT')
options=(!strip)
source=("$pkgname-$pkgver".zip::https://github.com/muan/mojibar/releases/download/"$pkgver"/mojibar-linux.zip)
_pkg='Mojibar-linux-x64'
sha512sums=('5ddd29a4fa1226fd86bca3bf4fffdcf2eaa81fd415140ea5fd88bf0b1b78a3484f266f5531984d27e2ffbe8ca4e9568a13b0e261ee93ca3163d542e42d761c11')

package() {
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -d "${pkgdir}/opt/${pkgname}"
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/share/icons" 

	install -m644 "${srcdir}/${_pkg}/resources/app/license.md" "${pkgdir}/usr/share/licenses/${pkgname}/license.md"
	install -m644 "${srcdir}/${_pkg}/resources/app/mojibar.png" "${pkgdir}/usr/share/icons/${pkgname}.png"

	cp -r "${srcdir}/${_pkg}/"* "${pkgdir}/opt/${pkgname}" -R
	ln -s /opt/${pkgname}/Mojibar "${pkgdir}"/usr/bin/mojibar
}
