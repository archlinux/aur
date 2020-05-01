# Maintainer: buzz
# Contributor: dude <brrtsm-AT-gmail-DOT-com>
pkgname=twitch-indicator
_gitname=twitch-indicator
pkgver=0.28.r0.g8175c76
pkgrel=1
pkgdesc="Twitch.tv indicator for Linux. Tracks your followed channels and notifies when they go live."
arch=("any")
url="https://github.com/buzz/twitch-indicator"
license=("ZLIB")
depends=("python3" "python-gobject" "desktop-file-utils" "libappindicator-gtk3")
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
    cd "${pkgdir}/usr/bin"
    ln -s "${pkgname}.py" "${pkgname}"
}

# vim:set ts=2 sw=2 et:
