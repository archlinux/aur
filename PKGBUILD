# Maintainer: jD91mZM2 <me@krake.one>
pkgname="aur-creator-tools-git"
pkgver=r6.7ceae9b
pkgrel=1
pkgdesc="Small tools to create and maintain AUR packages"
url="https://github.com/jD91mZM2/aur-creator-tools"
arch=("x86_64" "i386")
license=("MIT", "custom:MIT")
makedepends=()
optdepends=()
depends=()
source=("$pkgname::git+https://github.com/jD91mZM2/aur-creator-tools")
sha256sums=("SKIP")

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm 755 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    for script in aur-create-*; do
        install -Dm 755 "$script" "$pkgdir/usr/bin/$script"
    done
}
