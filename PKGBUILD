# Maintainer: jD91mZM2 <me@krake.one>
pkgname="aur-creator-tools"
pkgver=0.1.1
pkgrel=1
pkgdesc="Small tools to create and maintain AUR packages"
url="https://github.com/jD91mZM2/aur-creator-tools"
arch=("x86_64" "i386")
license=("MIT", "custom")
makedepends=()
optdepends=()
depends=()
source=("https://github.com/jD91mZM2/aur-creator-tools/archive/v$pkgver.tar.gz")
sha256sums=('b4fc77fc337a6abd909247290825976837ddfea08e5f3a88edac09409672972e')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm 755 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    for script in aur-create-*; do
        install -Dm 755 "$script" "$pkgdir/usr/bin/$script"
    done
}
