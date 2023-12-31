# Maintainer: jmcb <joelsgp@protonmail.com>

pkgname='vlc-plugin-pipewire'
pkgver='3.0'
_majorver="${pkgver%%.*}"
pkgrel=1
pkgdesc="PipeWire audio plugins for VLC"
arch=('x86_64')
url="https://www.remlab.net/vlc-plugin-pipewire/"
license=('GPL3')
depends=('vlc' 'pipewire')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
source=("https://www.remlab.net/files/${pkgname}/${pkgname}-v${_majorver}.tar.xz")
sha256sums=('dba410b7c11f295a6ea228bffeef31cf534f659ade75d15e7134308577124e7b')

build() {
  cd "$pkgname-v$_majorver"
  make
}

package() {
  cd "$pkgname-v$_majorver"
  make DESTDIR="$pkgdir/" install
}
