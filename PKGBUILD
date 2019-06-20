# Maintainer: spaceships <https://aur.archlinux.org/account/spaceships>
# Contributor: Brent Carmer <bcarmer@gmail.com>

pkgname=ghcup-git
_pkgname=ghcup

pkgver=0.0.7.r70.gb56597a
pkgrel=3

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

license=('BSD')
depends=()
pkgdesc='Painless installation of GHC toolchain'
url='https://gitlab.haskell.org/haskell/ghcup'
arch=('any')
md5sums=('SKIP')

source=('git+https://gitlab.haskell.org/haskell/ghcup.git')

package() {
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share
    install $srcdir/ghcup/ghcup $pkgdir/usr/bin
    cp -r $srcdir/ghcup $pkgdir/usr/share
    rm -fr $pkgdir/usr/share/ghcup/.git*
}
