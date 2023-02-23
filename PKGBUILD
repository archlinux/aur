# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

pkgname=jitsi-meet-turnserver-git
pkgver=1.0.7009+0+gc641835d0
pkgrel=1
pkgdesc="Jitsi Meet Prosody Plugins git build"
arch=('any')
url="https://jitsi.org/jitsi-meet/"
license=('Apache')
depends=()
optdepends=("coturn")
makedepends=(
        "git"
)
options=('!strip')
backup=(
)
source=(
        "$pkgname::git+https://github.com/jitsi/jitsi-meet"
)

pkgver() {
    cd "$pkgname"
    printf "1.0.%s" "$(git describe --exclude \*jitsi-meet\* --long | sed 's/-/+/g')"
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" doc/debian/jitsi-meet-turn/turnserver.conf doc/debian/jitsi-meet/jitsi-meet.conf
}
sha256sums=('SKIP')
