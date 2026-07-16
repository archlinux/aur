# maintainer: aray.4iv3@gmail.com
pkgname=kitty-theme-manager
pkgver=1.0.0
pkgrel=1
pkgdesc="The name says it all, a Kitty Theme Manager, or a extended kitty conf manager"
arch=('x86_64')
url="https://github.com/aray4iv3/kitty-theme-manager"
license=('GPL3')
depends=('kitty' 'coreutils')
makedepends=('clang')
source=("https://raw.githubusercontent.com/aray4iv3/kitty-theme-manager/refs/heads/master/main.cpp")
sha256sums=('b20b382fc6f712c0d50d7854a38faaebf9286b96b5686518652bf24ffadf1769')

build() {
    cd "$srcdir"
    clang++ -O3 main.cpp -o kitty-theme-manager
}

package() {
    cd "$srcdir"
    install -Dm755 kitty-theme-manager "$pkgdir/usr/bin/kitty-theme-manager"
}

