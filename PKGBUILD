# Maintainer: Vescrity <vescrity@foxmail.com>
_pkgname=wfrc
pkgname="$_pkgname-git"
pkgver=r36.c04ab6f
pkgrel=1
pkgdesc="Simple script makes screencast on wlroots compositors with shortcut easily."
arch=(any)
license=(LGPL-2.1-only)
url="https://github.com/Vescrity/wfrc"
depends=(
    bash
    slurp
    libnotify
    libpulse
    wl-clipboard
)
optdepends=(
    'pulse-native-provider: To record audio in the screencast'
    'wf-recorder: Default backend.'
    'wl-screenrec: Another backend.'
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
