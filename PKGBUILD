pkgname=firefox-extension-proxy-switcher
pkgdesc="This extension provides a proxy settings UI very similar to Firefox's built-in proxy setting window but right from Firefox's toolbar panel."
pkgver=0.1.9
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/proxy-switcher/"
makedepends=('unzip' )
depends=("firefox")
license=('MIT')
source=("${pkgname}.xpi::https://addons.mozilla.org/firefox/downloads/latest/proxy-switcher/addon-654096-latest.xpi" )
sha512sums=('4fbd842c773fea302a52b1cdb8332e65d1a1c92da4ca7c9a82e63fd70155886bf5afc4f44a23173a27ff02ac340c2a2bd10ebaa5bd6288374ed83b45cf52cbff')
noextract=("${pkgname}.xpi")

package(){
    srcxpi="${srcdir}/${pkgname}.xpi"
    emid=$(unzip -p "$srcxpi" install.rdf | sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}')
    install -Dm644 "$srcxpi" "${pkgdir}/usr/lib/firefox/browser/extensions/$emid.xpi"
}
