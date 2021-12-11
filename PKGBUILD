# Maintainer: Michał <stepien241@gmail.com>
pkgname=bootsound-git
pkgver=r3.4b883ff
pkgrel=1
pkgdesc="Systemd service that plays a sound at boot with alsa."
arch=(any)
url="https://gitlab.com/michalinteger/bootsound.git"
license=('Unlicense')
depends=(bash systemd alsa-utils)
makedepends=(git)
provides=(bootsound)
source=("git+${url}")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/bootsound"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd bootsound
    bash install.sh "$pkgdir"
}
