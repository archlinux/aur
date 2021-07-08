# Maintainer: taotieren <admin@taotieren.com>

pkgname=pts-tiny-7z-sfx
pkgver=9.22_pts6
pkgrel=1
epoch=
pkgdesc="pts-tiny-7z-sfx is a tiny 7-Zip (.7z archive) extractor and self-extractor(SFX) written in standard C. It's Unix-only, actively tested on Linux."
arch=('any')
url="https://github.com/pts/pts-tiny-7z-sfx"
license=('GPL v2')
groups=()
depends=('gcc')
makedepends=("gcc")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}-${pkgver/_/-}.tar.gz::${url}/archive/refs/tags/v${pkgver/_/+}.tar.gz")
noextract=()
sha256sums=('32867aca5b8095567834734c0406acb6309667c6765a9636c886516363e153a5')
#validpgpkeys=()

build(){
    cd ${pkgname}-${pkgver/_/-}
    make
}

package() {
    install -Dm0755 "${srcdir}/${pkgname}-${pkgver/_/-}/tiny7zx.dynamic" "${pkgdir}/usr/bin/tiny7zx"
}
