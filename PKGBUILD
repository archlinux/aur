# Maintainer: taotieren <admin@taotieren.com>

pkgname=pts-tiny-7z-sfx
pkgver=9.22_pts7
pkgrel=0
epoch=
pkgdesc="pts-tiny-7z-sfx is a tiny 7-Zip (.7z archive) extractor and self-extractor(SFX) written in standard C. It's Unix-only, actively tested on Linux."
arch=(x86_64
    aarch64
    riscv64)
url="https://github.com/pts/pts-tiny-7z-sfx"
license=('GPL v2')
groups=()
depends=(glibc)
makedepends=(libarchive)
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
sha256sums=('9bc7be2f54e0ef789825ac520e3d4a5c53cd208e4c362a915ef4644cb928e9f1')
#validpgpkeys=()

build(){
    cd "${srcdir}"/${pkgname}-${pkgver/_/-}
    make
}

package() {
    cd "${srcdir}"/${pkgname}-${pkgver/_/-}
    install -Dm0755 tiny7zx.dynamic "${pkgdir}"/usr/bin/tiny7zx
}
