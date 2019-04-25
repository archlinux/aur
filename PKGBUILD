# Maintainer: Jace Bennest <jacebennest87 at gmail dot com>
# Contributor: skydrome <skydrome at i2pmail dot org>
# Contributor: Adrian Wheeldon <arandomowl at gmail dot com>
# Contributor: StevensNJD4 <github dot com slash StevensNJD4>

pkgname=lazyman
pkgver=2.4.0.20181101
pkgrel=1
pkgdesc="A simple program that lets you stream every NHL and MLB game"
arch=('any')
url="https://github.com/StevensNJD4/LazyMan"
license=('GPL2')
depends=('java-runtime>=8' 'streamlink')
optdepends=('vlc: requires a video player - choose one' 'mpv: requires a video player - choose one')
backup=('usr/share/java/lazyman/config.properties')

source=("https://github.com/StevensNJD4/LazyMan/releases/download/${pkgver}/Mac_Linux.zip"
	"config.properties"
	"${pkgname}.sh"
	"${pkgname}.desktop"
	"${pkgname}.png"
	"${pkgname}.svg")

package() {
    cd "$srcdir"

    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/icons"
    install -dm755 "${pkgdir}/usr/share/icons/Numix-Circle/16/apps"
    install -dm755 "${pkgdir}/usr/share/icons/Numix-Circle/22/apps"
    install -dm755 "${pkgdir}/usr/share/icons/Numix-Circle/24/apps"
    install -dm755 "${pkgdir}/usr/share/icons/Numix-Circle/48/apps"
    install -dm777 "${pkgdir}/usr/share/java/lazyman"

    install -Dm755 lazyman.sh        "${pkgdir}/usr/bin/lazyman"
    install -Dm644 lazyman.png       "${pkgdir}/usr/share/icons/lazyman.png"
    install -Dm644 lazyman.svg       "${pkgdir}/usr/share/icons/Numix-Circle/16/apps/lazyman.svg"
    install -Dm644 lazyman.svg       "${pkgdir}/usr/share/icons/Numix-Circle/22/apps/lazyman.svg"
    install -Dm644 lazyman.svg       "${pkgdir}/usr/share/icons/Numix-Circle/24/apps/lazyman.svg"
    install -Dm644 lazyman.svg       "${pkgdir}/usr/share/icons/Numix-Circle/48/apps/lazyman.svg"
    install -Dm644 lazyman.desktop   "${pkgdir}/usr/share/applications/lazyman.desktop"
    install -Dm666 config.properties "${pkgdir}/usr/share/java/lazyman/config.properties"
        
    install -Dm755 mlbamproxy/linux/mlbamproxy       "${pkgdir}/usr/share/java/lazyman/mlbamproxy/linux/mlbamproxy"
    install -Dm755 mlbamproxy/linux/arm/mlbamproxy   "${pkgdir}/usr/share/java/lazyman/mlbamproxy/linux/arm/mlbamproxy"
    install -Dm755 mlbamproxy/linux/x86/mlbamproxy   "${pkgdir}/usr/share/java/lazyman/mlbamproxy/linux/x86/mlbamproxy"
    install -Dm755 mlbamproxy/linux/amd64/mlbamproxy "${pkgdir}/usr/share/java/lazyman/mlbamproxy/linux/amd64/mlbamproxy"
    
    install -Dm644 LazyMan.jar "${pkgdir}/usr/share/java/lazyman/LazyMan.jar"
}

md5sums=('e9af636a4fccfcd6e81a74f69247eaf0'
         'd41d8cd98f00b204e9800998ecf8427e'
         'b387dc6c2bdf54718d6d2e48f9f37e3d'
         'cc5998a228727420cbf7d07fc5318920'
         '41aebb968e8b6856d1b73cabd6a8c5d2'
         '838805914545f8ece3df2115b638252f')

