# Maintainer:   Zak Kohler <git@y2kbugger.com>
pkgname=dmenu-recent-aliases-git
pkgver=2020.04.11.79aeecc
pkgrel=1
epoch=
pkgdesc="Launch dmenu sorted based on a frequency of use."
arch=('any')
url="https://gitlab.com/y2kbugger-projects/scripts/dmenu-recent-aliases"
license=('GPL')
groups=()
depends=('dmenu2')
makedepends=()
checkdepends=()
optdepends=()
provides=(dmenu-recent-aliases)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://gitlab.com/y2kbugger-projects/scripts/dmenu-recent-aliases.git")
md5sums=('SKIP')
noextract=()
validpgpkeys=()


pkgver() {
    cd "$pkgname"
    date +%Y-%m-%d.$(git describe --always) |  sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    echo preparing
    ls
    echo done preparing
}

build() {
    cd "$pkgname"
    echo building
    ls
    echo done building
    # ./configure --prefix=/usr
    # make
}

check() {
    cd "$pkgname"
    # make -k check
}

package() {
    cd "$pkgname"
    make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
