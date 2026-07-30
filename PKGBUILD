# Maintainer: Samueru-sama xdglawyer@outlook.com
pkgname=12to11-git
pkgver=0.1
pkgrel=1
pkgdesc="Tool for running Wayland applications on an X server"
arch=('x86_64')
url="https://github.com/fish4terrisa-MSDSM/12to11"
license=('GPL-3.0-or-later')
source=("git+https://github.com/fish4terrisa-MSDSM/12to11")
sha256sums=('SKIP')
makedepends=(git imake gawk)
depends=(
  wayland pixman libx11 libxi libxkbfile libglvnd
  libxi libxrandr libxcb libdrm libxshmfence libxpresent
)

build() {
  cd "$srcdir/12to11"
  xmkmf
  make
}

package() {
  cd "$srcdir/12to11"
  install -Dm755 12to11 "$pkgdir/usr/bin/12to11"
}

