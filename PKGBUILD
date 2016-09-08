# Maintainer: Ivanka Heins (ivanka@tuta.io)

pkgname="opendungeons"
pkgver="0.7.1"
_pkgname="OpenDungeons-${pkgver}-Linux64"
pkgrel="1"
pkgdesc="Open source, real time strategy game sharing game elements with the Dungeon Keeper series and Evil Genius"
arch=('x86_64')
url="https://opendungeons.github.io"
options=('!strip')
license=("GPL3")
depends=("zziplib")
source=("ftp://download.tuxfamily.org/opendungeons/0.7/OpenDungeons-0.7.1-Linux64.tar.bz2"
        "opendungeons_startup")
md5sums=("ad05df375a5f0b720120147975029229"
         "a9b6e78b78d09e07b87a76b36ffa6969")

package() {
    cd $srcdir
    mkdir -p "${pkgdir}/opt"
    mkdir -p "${pkgdir}/usr/bin"
    cp -r $_pkgname/ "${pkgdir}/opt/${pkgname}"
    install -Dm755 opendungeons_startup "${pkgdir}/usr/bin/${pkgname}"
}

