# Maintainer: Randoragon <randoragongamedev@gmail.com>

pkgname=iniget-git
pkgver=1.0.r59.6a7386b
pkgrel=1
epoch=
pkgdesc="Extract information from INI files in CLI"
arch=('x86_64' 'i686' 'pentium4')
url="https://github.com/randoragon/iniget"
license=('MIT')
depends=()
makedepends=(git)
source=("git+$url")
md5sums=('SKIP')
provides=('iniget')

pkgver() {
    cd iniget
    printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd iniget
    make
}

package() {
    cd iniget
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/license.txt"
    install -Dm644 README.MD "$pkgdir/usr/share/doc/$pkgname/README.MD"
}

