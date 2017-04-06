pkgname=firefox-extension-leechblock
pkgdesc="LeechBlock is a simple free productivity tool designed to block those time-wasting sites that can suck the life out of your working day."
pkgver=1.0.8
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/leechblock/"
makedepends=('unzip' )
depends=("firefox")
license=('MIT')
source=("${pkgname}.xpi::https://addons.mozilla.org/firefox/downloads/latest/leechblock/addon-4476-latest.xpi" )
sha512sums=('00d5c6246b31f25ad319338bfd1f4f099a9178eba8fdbd99bc1ea80eedb240464bb8b14d04dc943838f54e99c03ffb8981f60ecb2589628b76a9cf3caa111ef2')
noextract=("${pkgname}.xpi")

package(){
    srcxpi="${srcdir}/${pkgname}.xpi"
    emid=$(unzip -p "$srcxpi" install.rdf | sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}')
    install -Dm644 "$srcxpi" "${pkgdir}/usr/lib/firefox/browser/extensions/$emid.xpi"
}
