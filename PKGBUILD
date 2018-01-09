# Maintainer: Adam Gausmann <agausmann@fastmail.com>
# Repository Maintainer: Neale Pickett <neale@woozle.org>

_pkgname="fluffy"
pkgname="${_pkgname}-git"
pkgver=r60.69ee969
pkgrel=1
pkgdesc="Tools for Network Archaeology (internet protocol analysis)"
arch=('any')
url="https://github.com/dirtbags/fluffy"
license=('custom')
groups=()
depends=()
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=()
install=
source=("git+https://github.com/dirtbags/${_pkgname}#branch=master" 'LICENSE')
noextract=()
md5sums=('SKIP' '19eef14ffb7f4fc3c0eb4febc4989311')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${_pkgname}"
}

build() {
    cd "$srcdir/${_pkgname}"
}

check() {
    cd "$srcdir/${_pkgname}"
}

package() {
    cd "$srcdir"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    cd "$srcdir/${_pkgname}"
    export CPPFLAGS="$CPPFLAGS -O"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
}
