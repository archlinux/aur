# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

pkgname=kde-select-and-translate
pkgver=20151222
pkgrel=1
pkgdesc="Select text and press Alt+Z for translate using Google Translate"
arch=('any')
url="https://github.com/horosgrisa/${pkgname}"
license=('MIT')
depends=('plasma-framework' 'xsel' 'libnotify' 'curl' 'translate-shell-git')
options=('!strip')
source=("translateselection" "select-and-translate.khotkeys" "LICENSE")
sha256sums=('047585e0d652f75c2c173ca69eec7b3f1f44b47347f1a53fe44f3acf58ad43d0' 'ce7f64ac60114bc119643a798e8a345ba4172b31780a8dff31c259f3e2227c1d' '1b7eb2d32c4613218a028772370e04720d028f7558f66c6d32cc3037cd72651b')

package() {
    install -d ${pkgdir}/usr/share/khotkeys
    install -d ${pkgdir}/usr/bin
	cp ${srcdir}/translateselection ${pkgdir}/usr/bin/
	cp ${srcdir}/select-and-translate.khotkeys ${pkgdir}/usr/share/khotkeys/
    install -D -m644  ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
 