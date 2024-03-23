# Maintainer: khing <bong.kook.khan@gmail.com>

pkgname=hyprdots-ctl-git
pkgver=v0.5.0.r11.0e8d3dd
pkgrel=1
pkgdesc="CLI for Hyprdots Configurations ++ Hidden Gems"
arch=('any')
url="git+https://github.com/kRHYME7/Hyprdots-ctl"
license=('GPL')
depends=( 'fzf' 'tree' 'ttf-jetbrains-mono-nerd' )
provides=("${pkgname}")
conflicts=("hyprdots-ctl")
replaces=("hyprdots-ctl")
source=("git+https://github.com/kRHYME7/Hyprdots-ctl#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/Hyprdots-ctl" || exit 1
    git fetch --all &> /dev/null
    printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"    
	# printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/Hyprdots-ctl" || return
    make DESTDIR="$pkgdir" clean all
}
