pkgname=plasma6-applets-arch-power-switch-git
pkgver=1.0.0.r0
pkgrel=1
pkgdesc="Plasma 6 power menu plasmoid with customizable panel icon"
arch=('any')
url="https://github.com/dechros/plasma6-applets-arch-power-switch-git"
license=('GPL-2.0-or-later')
depends=('plasma-workspace')
makedepends=('git')
provides=('plasma6-applets-arch-power-switch')
conflicts=('plasma6-applets-arch-power-switch')
source=("git+https://github.com/dechros/plasma6-applets-arch-power-switch-git.git")
sha256sums=('SKIP')

pkgver() {
    cd plasma6-applets-arch-power-switch-git
    local ver=$(grep -oP '"Version":\s*"\K[^"]+' package/metadata.json)
    local rev=$(git rev-list --count HEAD)
    local hash=$(git rev-parse --short HEAD)
    echo "${ver}.r${rev}.${hash}"
}

package() {
    cd plasma6-applets-arch-power-switch-git
    local _id="com.dechros.arch-power-switch"
    install -dm755 "$pkgdir/usr/share/plasma/plasmoids/$_id"
    cp -r package/* "$pkgdir/usr/share/plasma/plasmoids/$_id/"
}
