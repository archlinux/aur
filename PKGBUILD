pkgname=gauche-tk-git
_pkgname=Gauche-tk
pkgver=r27.3e16cd0
pkgrel=1
pkgdesc="Simple Tk binding for Gauche"
arch=('i686' 'x86_64')
url="https://github.com/shirok/Gauche-tk"
license=('BSD')
depends=('gauche' 'tk')
makedepends=('git')
source=("git+https://github.com/shirok/Gauche-tk")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"

    ./configure --prefix=/usr
}

check() {
    cd "$_pkgname"

    make -k check
}

package() {
    cd "$_pkgname"

    make DESTDIR="$pkgdir/" install
}
