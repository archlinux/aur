# Maintainer: Ivanka Heins (ivanka@tuta.io)

pkgname="opendungeons"
pkgver="0.7.1"
_pkgname="OpenDungeons-${pkgver}-Linux64"
pkgrel="3"
pkgdesc="Open source, real time strategy game sharing game elements with the Dungeon Keeper series and Evil Genius"
arch=('x86_64')
url="https://opendungeons.github.io"
options=('!strip')
license=("GPL3")
depends=("zziplib")
source=("ftp://download.tuxfamily.org/opendungeons/0.7/${_pkgname}.tar.bz2"
        "opendungeons_startup"
        "opendungeons.desktop")
md5sums=("63b6b56b175932f72f00004e22f1047a"
         "a9b6e78b78d09e07b87a76b36ffa6969"
         "a31950dd6599b97471a9b90472a43706")

package() {
    cd $srcdir
    mkdir -p "${pkgdir}/opt"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/applications"
    cp -r $_pkgname/ "${pkgdir}/opt/${pkgname}"
    install -Dm755 opendungeons_startup "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 opendungeons.desktop "${pkgdir}/usr/share/applications/opendungeons.desktop"
}

