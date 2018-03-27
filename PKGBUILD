# Maintainer: Ivanka Heins (ivanka@tuta.io)
# Contributor: oleerik

pkgname="hex-tcg"
pkgver="1.1.0.011"
_pkgname="hex"
pkgrel="1"
pkgdesc="Unofficial build for Hex: Shards of Fate, a digital card game"
arch=('i686' 'x86_64')
url="https://www.hextcg.com/"
options=("!strip" "staticlibs")
license=("custom: commercial")
depends=("libgl" "curl")
source=("http://fallback.hextcg.com/static/live/linux/hex.tar.gz"
	"https://www.hextcg.com/wp-content/themes/hex/images/logo-hex.png"
        "hex-tcg_startup"
        "hex-tcg.desktop")
sha256sums=("c3dfacb2a5fd0f6ef55c02bcd32a869e366c04b2a1669365cb2e2b7ab0b3bcaf"
            "SKIP"
	    "bc5c554bc1142e02f45eb1877388e595106362bad79c0f9232d124d51f981ecc"
            "27d2511d1044a340e313d715c85f79752269032ae1ecc2eeefbfadf0bfc2dd50")

package() {
    cd $srcdir
    install -dm755 "${pkgdir}/usr/bin" "${pkgdir}/opt/${pkgname}"
    install -Dm755 Hex.x86 "${pkgdir}/opt/${pkgname}/Hex.x86"
    install -Dm644 logo-hex.png "${pkgdir}/usr/share/icons/logo-hex.png"
    install -Dm644 hex-tcg.desktop "${pkgdir}"/usr/share/applications/hex-tcg.desktop
    cp -dr AssetBundles/ "${pkgdir}/opt/${pkgname}/AssetBundles"
    cp -d config.ini "${pkgdir}/opt/${pkgname}/config.ini"
    cp -dr Data/ "${pkgdir}/opt/${pkgname}/Data"
    cp -dr Hex_Data/ "${pkgdir}/opt/${pkgname}/Hex_Data"
    install -Dm755 hex-tcg_startup "${pkgdir}/usr/bin/${pkgname}"
}
