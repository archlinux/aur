# Maintainer: spaceships <https://aur.archlinux.org/account/spaceships>
# Contributor: Brent Carmer <bcarmer@gmail.com>

pkgname=ghcup-git
_pkgname=ghcup

pkgver=0.0.6.r13.gd0eae9a
pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

pkgrel=2
license=('BSD')
depends=()
pkgdesc='Painless installation of GHC toolchain'
url='https://github.com/haskell/ghcup'
arch=('any')
md5sums=('SKIP')

source=('git://github.com/haskell/ghcup.git')

package() {
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share
    cp -r $srcdir/ghcup $pkgdir/usr/share
    ln -s /usr/share/ghcup/ghcup $pkgdir/usr/bin/ghcup
}
