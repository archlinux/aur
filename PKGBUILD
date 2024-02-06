pkgname=hyprdots-ctl
pkgver=v0.3.24020613
pkgrel=1
pkgdesc="CLI for Hyprdots Configurations ++ Hidden Gems"
arch=('x86_64')
url="https://github.com/kRHYME7/Hyprdots-ctl"
license=('GPL3')
depends=( 'fzf' 'tree' 'ttf-jetbrains-mono-nerd' )
makedepends=('git' 'make' 'curl')
source=("git+https://github.com/kRHYME7/Hyprdots-ctl.git")
md5sums=('SKIP')

# pkgver() { #! If someone might read this help me automate the pkgver please. tnx
#   cd "$srcdir/Hyprdots-ctl" || return
#   git fetch --tags
#   git describe --tags | sed 's/-/./g' # Replace hyphens with dots to conform to versioning standards
# }

package() {
    cd "${srcdir}/Hyprdots-ctl" || return
    make DESTDIR="$pkgdir" clean all
}
