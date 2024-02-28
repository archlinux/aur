pkgname=hyprdots-ctl
pkgver=v0.3.5.24020613
pkgrel=1
pkgdesc="CLI for Hyprdots Configurations ++ Hidden Gems"
arch=('x86_64')
url="https://github.com/kRHYME7/Hyprdots-ctl"
license=('GPL3')
depends=( 'fzf' 'tree' 'ttf-jetbrains-mono-nerd' )
makedepends=('git' 'make' 'curl' 'base-devel')
source=("git+https://github.com/kRHYME7/Hyprdots-ctl.git")
md5sums=('SKIP')

pkgver() { 
  cd "$srcdir/Hyprdots-ctl" || return
  git fetch --tags
  git describe --long --tags --always | sed 's/-/./g' # Replace hyphens with dots to conform to versioning standards
}

package() {
    cd "${srcdir}/Hyprdots-ctl" || return
    make DESTDIR="$pkgdir" clean all
}
