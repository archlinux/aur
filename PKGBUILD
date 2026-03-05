# AUR: https://aur.archlinux.org/packages/laurel-git
# Maintainer: Yeyito <yeyito@yeyito.dev>
pkgname=laurel-git
pkgver=r0
pkgrel=1
pkgdesc='Self-hosted clip capture and sharing for Linux — press a hotkey, get a shareable link'
arch=('x86_64')
url='https://github.com/Yeyito777/Laurel'
license=('MIT')
depends=('gpu-screen-recorder' 'xclip' 'libx11' 'openssh')
optdepends=(
    'libnotify: desktop notifications via notify-send'
    'pipewire: clip sound playback via pw-play'
)
makedepends=('git')
provides=('laurel')
conflicts=('laurel')
install=laurel.install
backup=('etc/laurel/config.sh')
source=('git+https://github.com/Yeyito777/Laurel.git')
sha256sums=('SKIP')

pkgver() {
    cd Laurel
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd Laurel
    make
}

package() {
    cd Laurel
    make DESTDIR="$pkgdir" install
}
