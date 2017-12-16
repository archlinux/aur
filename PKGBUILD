# Maintainer: jD91mZM2 <me@krake.one>
pkgname="aur-creator-tools"
pkgver=0.1.2
pkgrel=1
pkgdesc="Small tools to create and maintain AUR packages"
url="https://github.com/jD91mZM2/aur-creator-tools"
arch=("x86_64" "i386")
license=("MIT", "custom")
makedepends=()
optdepends=()
depends=()
source=("https://github.com/jD91mZM2/aur-creator-tools/archive/v$pkgver.tar.gz")
sha256sums=('50815faf36a39232eafb3e46145307f502061ffc861c8988245e06b09acfe1a6')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm 755 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    for script in aur-create-*; do
        install -Dm 755 "$script" "$pkgdir/usr/bin/$script"
    done
}
