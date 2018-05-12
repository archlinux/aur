# Maintainer: Jeena <hello@jeena.net>

pkgname=typetalk
_name=TypeTalk
pkgver=2.1
pkgrel=1
pkgdesc="MaryTTS (Text2Speech) frontend with batteries included"
arch=('any')
url="http://typetalk.github.io/TypeTalk/"
license=('GPL3')
depends=('jre8-openjdk')
source=(
    "https://github.com/TypeTalk/TypeTalk/releases/download/v${pkgver}/TypeTalk-jar-with-dependencies.jar"
    "https://github.com/TypeTalk/TypeTalk/archive/v${pkgver}.tar.gz"
    "typetalk.desktop"
    "typetalk.xpm"
    "typetalk"
)
noextract=('TypeTalk-jar-with-dependencies.jar')
md5sums=('93d6d05da690d8b56df80b56db703297'
         '79cb99b9daaf391524588a416bb438de'
         'b218fe4440139f8701dc9f3fb1b57696'
         '5ed943e7194994bb590de4c4d6b9fa11'
         '3791265894ea8f813378b9faf0bc8d69')

package() {
    mkdir -p "${pkgdir}/usr/share/java/${pkgname}/"
    mkdir -p "${pkgdir}/usr/share/pixmaps/"
    mkdir -p "${pkgdir}/usr/share/applications/"
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
    
    install -D -m644 TypeTalk-jar-with-dependencies.jar "${pkgdir}/usr/share/java/${pkgname}/"
    install -D -m644 typetalk.xpm "${pkgdir}/usr/share/pixmaps/"
    install -D -m644 typetalk.desktop "${pkgdir}/usr/share/applications/"
    install -D -m755 typetalk "${pkgdir}/usr/bin/"
	cd "${_name}-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
