# Maintainer: imcb <irismessage@protonmail.com>

pkgname='vlc-plugin-pipewire'
pkgver='4'
pkgrel=1
pkgdesc="PipeWire audio plugins for VLC"
arch=('x86_64')
url="https://www.remlab.net/vlc-plugin-pipewire/"
license=('GPL-3.0-only')
depends=(
    'vlc'
    'pipewire'
)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
source=("https://www.remlab.net/files/${pkgname}/${pkgname}-v${pkgver}.tar.xz")
sha256sums=('13f19df13800c2a385c2b352299a7a69ccb1812a41bd77816db67f7a65faae8e')

build() {
    cd "$pkgname-v$pkgver"
    make
}

package() {
    cd "$pkgname-v$pkgver"
    make DESTDIR="$pkgdir/" install
}
