# Maintainer: Zheralix <zheralix356@gmail.com>

pkgname=gui-cli-toggle
pkgver=2.1.0
pkgrel=1
pkgdesc="A script to toggle between multi-user and graphical targets, Written in bash 5.3.9+"
arch=(any)
url="https://www.github.com/Zheralix/$pkgname"
license=("custom:$pkgname")
depends=(
    systemd
    bash
)
makedepends=(
    make
    coreutils
    tar
    git
)
optdepends=(
    'gdm: GNOME Display Manager'
    'sddm: KDE Display Manager'
    'lightdm: Lightweight Display Manager'
    'lxdm: LXDE Display Manager'
)
provides=("$pkgname")
conflicts=("$pkgname")
options=(!strip !docs !libtool !staticlibs !emptydirs !zipman !ccache !distcc !buildflags !makeflags !debug !lto)
install=".INSTALL"
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=("c9da1ae3598dfa5e2f47cf86e168e0ec13ba8cb94efd6cc13624b771089859c7")
_prefix="/usr"

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX="$_prefix" BINDIR="$_prefix/bin" install-without-msg
}
