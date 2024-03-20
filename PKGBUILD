pkgname=hyprdots-ctl-git
pkgver=v0.4.0.r39.g38d5c70
pkgrel=2
pkgdesc="CLI for Hyprdots Configurations ++ Hidden Gems"
arch=('x86_64')
url="https://github.com/kRHYME7/Hyprdots-ctl"
license=('GPL3')
depends=( 'fzf' 'tree' 'ttf-jetbrains-mono-nerd' )
makedepends=('git' 'make' 'curl' 'base-devel')
conflicts=("hyprdots-ctl")
source=("git+https://github.com/kRHYME7/Hyprdots-ctl.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/Hyprdots-ctl" || return
    git fetch --tags
    local version=$(git describe FETCH_HEAD | sed 's/\([^-]*-g[0-9a-f]*\)/r\1/;s/[-+]/./g')
    echo "$version"
}

package() {
    cd "${srcdir}/Hyprdots-ctl" || return
    make DESTDIR="$pkgdir" clean all
}
