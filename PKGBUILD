# Maintainer: buzz <buzz-AT-l4m1-DOT-de>
pkgname=volctl
_gitname=volctl
pkgver=0.3.r0.gc5a4b3f
pkgrel=1
pkgdesc="Per-application volume control for GNU/Linux desktops"
arch=("any")
url="https://buzz.github.io/volctl/"
license=("GPL")
groups=()
depends=("python2" "python2-gobject" "pulseaudio" "desktop-file-utils")
install=volctl.install
optdepends=("pavucontrol: mixer support")
makedepends=("git")
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("git+https://github.com/buzz/volctl.git")
md5sums=("SKIP")

pkgver() {
    cd "${_gitname}"
    git describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
    cd "${_gitname}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
