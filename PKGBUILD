# Maintainer: Zheralix <zheralix356@gmail.com>

pkgname=gui-cli-toggle
pkgver=2.0.1
pkgrel=1
pkgdesc="A script to toggle between multi-user and graphical targets, Written in bash 5.3.9+"
arch=(any)
url="https://www.github.com/Zheralix/$pkgname"
license=(unknown)
depends=(systemd bash coreutils)
makedepends=(make coreutils tar)
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
sha256sums=("27e44409fdf55c76e9606497942f7ce0752bdaf9bb1fb945739f868b9031c747")
_prefix="/usr"

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX="$_prefix" BINDIR="$_prefix/bin" install-without-msg
}
