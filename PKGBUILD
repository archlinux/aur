# Maintainer: Wesley Hershberger <mggmugginsmc at gmail>
pkgname=aurum
pkgver=0.1.0
pkgrel=1
pkgdesc="An AUR helper written in Rust"
arch=('x86_64')
url="https://gitlab.com/MggMuggins/aurum"
license=('MIT')
depends=('sudo' 'pacman' 'xz')
makedepends=('cargo')
conflicts=('aurum-git')
source=("$pkgname::git+https://gitlab.com/MggMuggins/aurum.git")
sha256sums=('SKIP')

package() {
    mkdir "$pkgdir/usr"
    
    # Not ideal (building in package())
    cargo install --root="$pkgdir/usr" --version="$pkgver" aurum-cli
    
    rm "$pkgdir/usr/.crates.toml"
}
