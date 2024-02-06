pkgname=hyprdots-ctl
pkgver=v0.2.0.46.24020612
pkgrel=1
pkgdesc="CLI for Hyprdots Configurations ++ Hidden Gems"
arch=('x86_64')
url="https://github.com/kRHYME7/Hyprdots-ctl"
license=('GPL3')
depends=( 'fzf' 'tree' 'ttf-jetbrains-mono-nerd' )
makedepends=('git' 'make' 'curl')
source=("git+https://github.com/kRHYME7/Hyprdots-ctl.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname" || return
  git describe --tags | sed 's/-/./g' # Replace hyphens with dots to conform to versioning standards
}

package() {
    cd "${srcdir}/Hyprdots-ctl"
    make DESTDIR="$pkgdir" clean all
}
