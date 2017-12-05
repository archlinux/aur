# Maintainer: jD91mZM2 <me@krake.one>
pkgname="aur-creator-tools"
pkgver=0.1.0
pkgrel=1
pkgdesc="Small tools to create and maintain AUR packages"
url="https://github.com/jD91mZM2/aur-creator-tools"
arch=("x86_64" "i386")
license=("MIT", "custom")
makedepends=()
optdepends=()
depends=()
source=("https://github.com/jD91mZM2/aur-creator-tools/archive/v$pkgver.tar.gz")
sha256sums=('f198da3589a947c94fff35c2d6d3aebfac729eca12bd8d620d9434bb08a0933d')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm 755 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    for script in aur-create-*; do
        install -Dm 755 "$script" "$pkgdir/usr/bin/$script"
    done
}
