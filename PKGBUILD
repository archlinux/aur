# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
pkgname=otii
pkgver=1.5.3
pkgrel=1
pkgdesc="Energy consumption analysis software by Qoitech"
arch=('x86_64')
url="https://www.qoitech.com/download"
license=('custom')
groups=()
depends=('qt5-serialport' 'qt5-quickcontrols2' 'qt5-svg'
         'gcc-libs-multilib' 'hicolor-icon-theme')
makedepends=('deb2targz')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://www.qoitech.com/downloads/${pkgname}_${pkgver}.deb"
        "LICENSE")
sha256sums=('ba0037d348a912c85498c7dd5e463b713f481b58e62afa54aa073c215216402b'
            '6613e04098c77b408e006653f114156e9c8d1f21d73ddd24375c5599848502f1')

validpgpkeys=()

prepare() {
    tar xf data.tar.lzma
}

package() {
    cp -a usr etc $pkgdir/
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
