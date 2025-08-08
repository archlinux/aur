# Maintainer: Vescrity <vescrity@foxmail.com>
_pkgname=wfrc
pkgname="$_pkgname-git"
pkgver=r27.946f6d8
pkgrel=1
pkgdesc="Simple bash script to record screen on wlroots-based compositors using wf-recorder."
arch=(any)
url="https://github.com/Vescrity/wfrc"
depends=(
    wf-recorder
    bash
    slurp
    libnotify
    libpulse
    wl-clipboard
)
optdepends=(
)
makedepends=(
  git
)
provides=(wfrc)
conflicts=()
source=("git+https://github.com/Vescrity/wfrc")
sha256sums=('SKIP')
pkgver() {
    cd "$srcdir/wfrc"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
package() {
  cd "$srcdir/wfrc"
  install -d "${pkgdir}/usr/bin"
  install -Dm755 "wfrc" "${pkgdir}/usr/bin/wfrc"
}
