# Maintainer: Vescrity <vescrity@foxmail.com>
_pkgname=wfrc
pkgname="$_pkgname-git"
pkgver=r30.f39dc41
pkgrel=1
pkgdesc="Wrapper of wf-recorder/wl-screenrec, make screencast on wlroots compositor with shorcut easily."
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
