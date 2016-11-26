# Maintainer: Jeena <hello@jeena.net>

pkgname=typetalk
_name=TypeTalk
pkgver=1.7
pkgrel=1
pkgdesc="MaryTTS (Text2Speach) frontend with batteries included"
arch=('any')
url="http://typetalk.github.io/TypeTalk/"
license=('GPL3')
depends=('jre8-openjdk')
source=(
    "https://github.com/TypeTalk/TypeTalk/releases/download/v${pkgver}/TypeTalk.one-jar.jar"
    "https://github.com/TypeTalk/TypeTalk/archive/v${pkgver}.tar.gz"
    "typetalk.desktop"
    "typetalk.xpm"
)
noextract=('TypeTalk.one-jar.jar')
md5sums=('ef6872d1db3eb6bf2d41ef9005abff27'
         '54579da8bfb0b404f3a3f096b8d92150'
         'e70b5faf7e776a86a2d3c33f4a2beea1'
         '5ed943e7194994bb590de4c4d6b9fa11')

package() {
    mkdir -p "${pkgdir}/usr/share/${pkgname}/"
    mkdir -p "${pkgdir}/usr/share/pixmaps/"
    mkdir -p "${pkgdir}/usr/share/applications/"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
    
    install -D -m644 TypeTalk.one-jar.jar "${pkgdir}/usr/share/${pkgname}/"
    install -D -m644 typetalk.xpm "${pkgdir}/usr/share/pixmaps/"
    install -D -m644 typetalk.desktop "${pkgdir}/usr/share/applications/"
	cd "${_name}-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
