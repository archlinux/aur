# Maintainer: Lyr <lyr-7d1h@pm.me>
# Maintainer: Y7n05h <Y7n05h(aT)protonmail--d0t--com>

pkgname=sworkstyle
_pkgname=swayest_workstyle
pkgver=1.2.5
pkgrel=1
pkgdesc="Swayest Workstyle - This tool will rename workspaces to the icons configured. Mainly meant for Sway WM"
arch=("x86_64")
url="https://github.com/Lyr-7D1h/swayest_workstyle"
license=("MIT")
depends=("gcc-libs")
optdepends=("otf-font-awesome")
makedepends=("cargo")
conflicts=(sworkstyle-git)
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "sworkstyle.man")
sha256sums=('49a69411c74a2d95084677dea98abf114208f87fcd54f6317bc6f6c1954deb71'
            'd16f4284fe6419603db058b878a32a56574a51409648a6ddbd1b516d50cb3eb7')

build() {
    cd "$_pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$_pkgname-$pkgver"
    install -D -m755 "target/release/$pkgname" "$pkgdir/usr/bin/sworkstyle"
    install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 "$srcdir/$pkgname.man" "$pkgdir/usr/share/man/man1/$pkgname.1"
}