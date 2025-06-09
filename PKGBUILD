<<<<<<< HEAD
# Maintainer: Jonas Møller <jonas.moeller2@protonmail.com>
pkgname=ncduh-git
_pkgname=ncduh
pkgver=20240402
pkgrel=1
pkgdesc="ncdu fork"
arch=("x86_64")
url="https://git.sr.ht/~snybl/ncduh"
license=('BSD')
depends=()
makedepends=("zig")
optdepends=()
install=$pkgname.install
replaces=('ncdu')
conflicts=('ncdu')
source=("git+https://git.sr.ht/~snybl/ncduh")
md5sums=("SKIP")

pkgver() {
    cd $_pkgname
    TZ=UTC date -d @$(git log -1 --format=%ct) +%Y%m%d
=======
# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>
# Contributor: Jonas Møller <jonas.moeller2@protonmail.com>
pkgname=ncduh-git
_pkgname=ncdu
pkgver=v2.8.2.r0.g5b96a48
pkgrel=1
pkgdesc="Disk usage analyzer with an ncurses interface"
arch=("x86_64")
url="https://dev.yorhel.nl/ncdu"
license=('MIT')
depends=(
  'ncurses'
  'glibc'
  'zstd'
)
makedepends=("zig")
provides=('ncdu')
conflicts=('ncdu')
source=("git://g.blicky.net/ncdu.git")
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
>>>>>>> 009248e (updated pkgver function, corrected license (bsd to mit), switched upstream homepage and source urls to maintained channels, undoing 'ncduh' moniker; ilovemikael adopted package and is the new maintainer (thank you snyball for creating this pkgbase, hopefully (mayhaps) someday you'll see it! =)).)
}

prepare() {
    cd "$_pkgname"
}

build() {
    cd "$_pkgname"
    zig build
}

package() {
<<<<<<< HEAD
    out="$(realpath "$pkgdir")"
    cd "$_pkgname"
    mkdir -p "${out}/usr/bin"
    cp "zig-out/bin/ncdu" "${out}/usr/bin/ncduh"
    ln -s "${out}/usr/bin/ncduh" "${out}/usr/bin/ncdu"
=======
    cd "$_pkgname"
    install -Dm755 "zig-out/bin/ncdu" "${pkgdir}/usr/bin/ncdu"
>>>>>>> 009248e (updated pkgver function, corrected license (bsd to mit), switched upstream homepage and source urls to maintained channels, undoing 'ncduh' moniker; ilovemikael adopted package and is the new maintainer (thank you snyball for creating this pkgbase, hopefully (mayhaps) someday you'll see it! =)).)
}
