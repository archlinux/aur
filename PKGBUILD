# Maintainer: Nguyen Ky <nhktmdzhg at google mail>
pkgname=fcitx5-vmk
pkgver=0.9.3alpha2
pkgrel=1
pkgdesc="VMK (Vietnamese Micro Key) for Fcitx5 - Bộ gõ tiếng Việt mô phỏng UniKey"
arch=('x86_64')
url="https://github.com/nhktmdzhg/VMK"
license=('GPL-3.0-or-later')
depends=('fcitx5' 'libinput' 'hicolor-icon-theme' 'glibc' 'gcc-libs' 'systemd-libs')
makedepends=('cmake' 'go' 'extra-cmake-modules' 'gcc' 'git' 'libx11')
provides=('fcitx5-vmk')
conflicts=('fcitx5-vmk')
source=('git+https://github.com/nhktmdzhg/VMK.git#tag=v0.9.3-alpha2')
sha256sums=('SKIP')
install='fcitx5-vmk.install'


build() {
    cd "$srcdir/VMK/"
    make build
}

package() {
    cd "$srcdir/VMK/"
    make install DESTDIR="$pkgdir"
}
