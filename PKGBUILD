# Maintainer: Rasmus Steinke <rasi at xssn dot at>
# Contributor: Christian Rebischke

pkgname=clerk_fzf-git
pkgver=799.7cac52d
pkgrel=1
pkgdesc="clerk - mpd client for rofi"
arch=('any')
url='https://github.com/carnager/clerk'
license=('GPL')
depends=('tmux' 'mpc' 'fzf' 'util-linux')
optdepends=('sl: fancy update animation')
makedepends=('git')
source=('git+https://git.53280.de/clerk')

pkgver() {
	cd clerk
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd clerk/clerk_fzf
    ls
    make DESTDIR="$pkgdir/" \
       PREFIX='/usr' \
       install
}

md5sums=('SKIP')
