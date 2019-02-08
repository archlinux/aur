# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
pkgname=otii
pkgver=2.4.0
pkgrel=1
pkgdesc="Energy consumption analysis software by Qoitech"
arch=('x86_64')
url="https://www.qoitech.com/download"
license=('custom')
groups=()
depends=('qt5-serialport' 'qt5-quickcontrols2' 'qt5-svg'
         'gcc-libs-multilib' 'hicolor-icon-theme')
makedepends=()
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
sha256sums=('a1acfb2ff3f62cd3ef7130c52d905d82910c2ec0cfc2579850934f55a0a0b4f8'
            '6613e04098c77b408e006653f114156e9c8d1f21d73ddd24375c5599848502f1')

validpgpkeys=()

prepare() {
    tar xf data.tar.xz
}

package() {
    cp -a usr $pkgdir/
    cp -a lib $pkgdir/usr/
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
