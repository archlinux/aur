# Maintainer: Tim Kleinschmidt <tim.kleinschmidt@gmail.com>

pkgname=avocode
pkgrel=1
pkgver=2.9.1
pkgdesc="The bridge between designers and developers"
url="http://avocode.com/"
provides=('avocode')
arch=('i686' 'x86_64')
license=('custom')
depends=(libxtst libnotify alsa-lib gtk2 gconf)
optdepends=('imagemagick: Preview generation')
makedepends=()
backup=()
install=avocode.install
source=("Avocode.desktop" "avocode-app-icon.png")
source_i686=("https://media.avocode.com/download/avocode-app/${pkgver}/avocode-app-linux-ia32-${pkgver}.zip")
source_x86_64=("https://media.avocode.com/download/avocode-app/${pkgver}/avocode-app-linux-${pkgver}.zip")
md5sums=('e2c75eca26477c665c946beec421423a'
         '96c2dd65a4a3ac5bcdba7426ade1960e')
md5sums_i686=('38efd6349e051c9b9b758f7bc34db7e1')
md5sums_x86_64=('56da65133262db782be07b811e374d36')
package() {
	install -d "$pkgdir"/opt
	cp -R "$srcdir"/Avocode-linux-x64/ "$pkgdir"/opt/avocode

	find "$pkgdir"/opt/avocode/ -type f -exec chmod 644 {} \;
	chmod 755 "$pkgdir"/opt/avocode/Avocode

	install -d "$pkgdir"/usr/bin
	ln -s ../../opt/avocode/Avocode "$pkgdir"/usr/bin/avocode

    install -D -m644 "../Avocode.desktop"           "${pkgdir}/usr/share/applications/Avocode.desktop"
    install -D -m644 "../avocode-app-icon.png"      "${pkgdir}/usr/share/pixmaps/avocode-app-icon.png"
}
