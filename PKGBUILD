# Maintainer: Jeena <hello@jeena.net>

pkgname=typetalk
_name=TypeTalk
pkgver=1.7
pkgrel=2
pkgdesc="MaryTTS (Text2Speech) frontend with batteries included"
arch=('any')
url="http://typetalk.github.io/TypeTalk/"
license=('GPL3')
depends=('jre8-openjdk')
source=(
    "https://github.com/TypeTalk/TypeTalk/releases/download/v${pkgver}/TypeTalk.one-jar.jar"
    "https://github.com/TypeTalk/TypeTalk/archive/v${pkgver}.tar.gz"
    "typetalk.desktop"
    "typetalk.xpm"
    "typetalk"
)
noextract=('TypeTalk.one-jar.jar')
md5sums=('ef6872d1db3eb6bf2d41ef9005abff27'
         '54579da8bfb0b404f3a3f096b8d92150'
         '5f5327ea5b39269670502c295359768b'
         '5ed943e7194994bb590de4c4d6b9fa11'
         '6b4447d08ff1e929e730d7e912cd6ee3')

package() {
    mkdir -p "${pkgdir}/usr/share/java/${pkgname}/"
    mkdir -p "${pkgdir}/usr/share/pixmaps/"
    mkdir -p "${pkgdir}/usr/share/applications/"
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
    
    install -D -m644 TypeTalk.one-jar.jar "${pkgdir}/usr/share/java/${pkgname}/"
    install -D -m644 typetalk.xpm "${pkgdir}/usr/share/pixmaps/"
    install -D -m644 typetalk.desktop "${pkgdir}/usr/share/applications/"
    install -D -m755 typetalk "${pkgdir}/usr/bin/"
	cd "${_name}-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
