# Maintainer: Chad Bergeron <chad@chadbergeron.com>
pkgname=conclave
pkgver=1.0.0
pkgrel=1
pkgdesc="A tabletop-inspired RPG you can play solo or co-op, at any pace."
arch=(x86_64)
url="https://www.playconclave.com/"
license=('custom: "commercial"')
depends=('gtkglext' 'libgcrypt15' 'libudev.so.0')
source=(http://s3.amazonaws.com/conclave/downloads/linux/${pkgname}-${pkgver}.tar.gz conclave.desktop conclave.png)
md5sums=('b0eabf7c1e00166a5bddae3c478116ee'
         '9ca98eba646a9441869615fac80a898c'
         'ad4c1df20cd8b17ac99ab23c1398b2f3')

package() {
install -dm775 -g users ${pkgdir}/opt/${pkgname}
install -dm775 -g users ${pkgdir}/opt/${pkgname}/files
install -dm775 -g users ${pkgdir}/opt/${pkgname}/locales



install -D -m775 "${srcdir}/${pkgname}/${pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"
install -D -m644 "${srcdir}/${pkgname}/cef.pak" "${pkgdir}/opt/${pkgname}/cef.pak"
install -D -m644 "${srcdir}/${pkgname}/README.txt" "${pkgdir}/opt/${pkgname}/README.txt"
install -D -m644 "${srcdir}/${pkgname}/libcef.so" "${pkgdir}/usr/lib/libcef.so"
install -D -m644 "${srcdir}/${pkgname}/libffmpegsumo.so" "${pkgdir}/usr/lib/libffmpegsumo.so"
install -D -m644 "${srcdir}/${pkgname}/files/load_error.html" "${pkgdir}/opt/${pkgname}/files/load_error.html"

cd "${srcdir}/${pkgname}/locales"
cp -pd * ${pkgdir}/opt/${pkgname}/locales/

    # Desktop launcher with icon
    install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D -m644 "${srcdir}/${pkgname}.png"     "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
