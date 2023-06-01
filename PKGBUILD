# Maintainer: Nicolai Brand <nicolaibrand2002 at gmail dot com>
pkgname=tomatoshell
pkgver=r21.ed04b1c
pkgrel=1
pkgdesc="Pomodoro timer in the shell"
arch=("x86_64")
url="https://github.com/lytixDev/tomatoshell"
license=('GPL2')
depends=("alsa-lib" "coreutils" "bc")
optdepends=("figlet: cool text"
            "mpv: play alarm sound"
            "pulseaudio: better sound")
makedepends=("git")
source=("tomatoshell::git+https://github.com/LytixDev/tomatoshell.git")
md5sums=("SKIP")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    ./configure install
}
