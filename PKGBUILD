# Maintainer: honjow
pkgname=holo-gs-auto-update
pkgver=r1.1713b2e
pkgrel=1
pkgdesc="A script to automatically update gamescope-session after it is updated for holoiso"
arch=('any')
url="https://github.com/mengmeet/holo-auto-modify-gamescope-session"
license=('MIT')
makedepends=('git')
provides=(holo-gs-auto-update)
conflicts=(holo-gs-auto-update)
source=("git+$url")
sha256sums=('SKIP')
options=(!strip)

pkgver() {
    cd "$srcdir/holo-auto-modify-gamescope-session"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/holo-auto-modify-gamescope-session/holo-root"
    install -D "etc/pacman.d/hooks/99-modify-gamescope-session.hook" "$pkgdir/etc/pacman.d/hooks/99-modify-gamescope-session.hook"
    install -D "usr/bin/gs-update" "$pkgdir/usr/bin/gs-update"
    install -D "usr/bin/gamescope-device" "$pkgdir/usr/bin/gamescope-device"
}
