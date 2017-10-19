# Maintainer: buzz <buzz-AT-l4m1-DOT-de>
pkgname=twitch-indicator
_gitname=twitch-indicator
pkgver=0.26.r4.g14a49ae
pkgrel=1
pkgdesc="Twitch.tv indicator for Linux. Tracks your followed channels and notifies when they go live."
arch=("any")
url="https://github.com/buzz/twitch-indicator"
license=("ZLIB")
depends=("python3" "python-gobject" "desktop-file-utils")
makedepends=("git")
options=(!emptydirs)
source=("git+https://github.com/buzz/twitch-indicator.git")
md5sums=("SKIP")

pkgver() {
    cd "${_gitname}"
    git describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
    cd "${_gitname}"
    python3 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
