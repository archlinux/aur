# Maintainer: Shadowsith <philip.mayer@shadowsith.de>

pkgname=qpicospeaker-git
pkgsrc=qpicospeaker
pkgver=r10.ec83c9a
pkgrel=1
pkgdesc='Qt GUI for the svox-pico text-to-speech engine'
arch=('i686' 'x86_64')
url='https://github.com/Shadowsith/qpicospeaker'
licence=('MIT')
depends=('sox' 'svox-pico-bin')
makedepends=(qt5-base)
optdepends=()
provides=('')
backup=("")
install=
source=("git+https://github.com/Shadowsith/qpicospeaker")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgsrc"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    pwd
    make -C ./qpicospeaker/build
}

package() {
    make install -C ./qpicospeaker/build
}

