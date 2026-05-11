# Maintainer: Lunix (David Hess) <davidhess336@gmx.de>

pkgname='dimethoxy-disflux-bin'
pkgver=1.2.0
pkgrel=2
pkgdesc="Phase Dispersion Audio Effect for VST3, LV2 and CLAP compatible hosts"
arch=('x86_64')
options=('!debug' '!strip')
url="https://github.com/Dimethoxy/Disflux"
license=('GPL3')
provides=('dimethoxy-disflux')
conflicts=('dimethoxy-disflux' 'dimethoxy-disflux-git' 'dimethoxy-disflux-bin')
source=("https://github.com/Dimethoxy/Disflux/releases/download/v${pkgver}/disflux-v${pkgver}-linux-arch.pkg.tar.zst")
sha256sums=('f1934a613a9a2c9e6736cfaf16485d82dc5c7e27e12cd5645902246bbde68775')

package() {
    bsdtar -xf "$srcdir/disflux-v${pkgver}-linux-arch.pkg.tar.zst" -C "$pkgdir"

    # Remove upstream pacman metadata (critical fix)
    rm -f "$pkgdir/.PKGINFO" \
          "$pkgdir/.BUILDINFO" \
          "$pkgdir/.MTREE"
}