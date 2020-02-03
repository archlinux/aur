# Maintainer: ahbnr <anton dot haubner at outlook dot de>

pkgname=yt-bin
pkgver=r23.1f04565
pkgrel=1
pkgdesc="Youtube Terminal UI for music streaming. WIP."
arch=('x86_64')
license=('GPL3')
depends=('ncurses>=6.1' 'mpv>=1:0.32.0')
makedepends=()
replaces=()
conflicts=()
provides=('yt')
backup=()
options=()
install=
source=('https://ahbnr.de/jenkins/job/yt/13/artifact/yt' 'https://ahbnr.de/jenkins/job/yt/13/artifact/version')
noextract=()
md5sums=('SKIP' 'SKIP')

pkgver() {
  cat "$srcdir/version"
}

build() {
  chmod +x "$srcdir/yt"
}

package() {
  binary="yt"

  strip -s "${binary}"

  mkdir -p "$pkgdir/usr/bin"
  cp "${binary}" "$pkgdir/usr/bin"
}
